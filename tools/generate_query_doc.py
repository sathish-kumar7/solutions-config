import json
import os
import urllib.parse
import sys
import requests
import time
import argparse

# Borrowed from https://thispointer.com/python-three-ways-to-check-if-a-file-is-empty/
"""Check if file is empty by reading first character in it"""
# open file in read mode
def is_file_empty(file_name):
    with open(file_name, 'r') as read_obj:
        # read first character
        one_char = read_obj.read(1)
        # if not fetched then file is empty
        if not one_char:
            return True
    return False

def escape_text(text):
    return(text.replace(")", "\)").replace("(", "\(").replace("|", "\|"))

def add_more_space_between_subqueries(text):
    return text.replace("|>", "  |>  ")

def escape_pipe(text):
    return text.replace("|", "\|")

def md_header(text, level):
    return f"\n {'#' * level} {text}"

def md_new_line(text):
    return f" \n {text}"

def md_link(url, **kwargs):
    if (("text" in kwargs) and ("query_param_to_encode" in kwargs)):
        return f"[{escape_text(kwargs['text'])}]({url + urllib.parse.quote(kwargs['query_param_to_encode'])})" 
    elif "text" in kwargs:
        return f"[{escape_text(kwargs['text'])}]({escape_text(url)})" 
    elif "query_param_to_encode" in kwargs:
        return f"[{escape_text(url) + escape_text(kwargs['query_param_to_encode'])}]({url + urllib.parse.quote(kwargs['query_param_to_encode'])})"
    else:
        return  f"[{escape_text(url)}]({url})" 

def replace_global_date_variables(text, default_start_date, default_end_date):
    return text.replace("{END_DATE}", f"'{default_end_date}'").replace("{START_DATE}", f"'{default_start_date}'")

def md_table(columns, rows, text_list):
    table = '\n'
    headers = text_list[:columns]
    row_num = 0
    while row_num < len(text_list):
        table += f"\n |"
        for item in text_list[row_num:(row_num+columns)]:
            table += f" {item} |"
        if row_num == 0:
            table += "\n" + ("|--------- " * columns) + "|" 
        row_num += columns
    return table

def run_query(query_url):
    print("QUERY: ", query_url)
    return requests.request("GET", query_url, auth=(SOCRATA_API_KEY_ID, SOCRATA_API_KEY))

def test_query(base_url, soql_query):
    query_url = base_url + urllib.parse.quote(soql_query)
    t0 = time.time()
    res = run_query(query_url)
    print(res)
    t1 = time.time()
    return round(t1-t0, 2)

def parse_and_write_config(_json_config, _file_name, _folder_name=''):
    _title = _json_config['branding']['title']

    if 'date' in _json_config:
        default_start_date = _json_config['date']['startDate']
        default_end_date = _json_config['date']['endDate']
    
    if (_folder_name != ''):
        output_file_location = f"docs/{_folder_name}/{_file_name}.md"
    else:
        output_file_location = _file_name

    with open(output_file_location,'w') as md_file:
        md_file.write(md_header(_title, 1))
        for entry in _json_config['template_entries']:
            md_file.write(md_header(entry["name"], 2))

            md_file.write(md_new_line(f"Dataset Link: {entry['dataset_domain']}/d/{entry['dataset_id']}"))
            if 'parent_queries' in entry:
                md_file.write(md_new_line(f"Parent Queries for dataset are: "))
                parent_queries = ['Parent Queries'] + entry['parent_queries']
                md_file.write(md_table(1, int(len(parent_queries)), parent_queries))

            md_file.write(md_header(f"Data Dimensions", 4))

            dim_list = ['Name', "Field Name"]
            for dim_entry in entry['dimension_entries']:
                dim_list.append(dim_entry['name'])
                dim_list.append(dim_entry['column'])

            md_file.write(md_table(2, int(len(dim_list) / 2), dim_list))
            md_file.write(md_header("Measures", 4))

            if (performance_flag):
                measure_list = ["Measure Name", "SoQL Query", "Example Link", "Approximate Query Time (in seconds)"]
            else:
                measure_list = ["Measure Name", "SoQL Query", "Example Link"]

            for view_entry in entry["view_entries"]:
                measure_list.append(view_entry['name'])
                soql_queries = []

                if ('parent_queries' in entry):
                    soql_queries += parent_queries[1:]

                if ('parent_queries' in view_entry):
                    soql_queries += view_entry['parent_queries']
               
                if 'aggregate_type' in view_entry:
                    soql_queries += [f"SELECT {view_entry['aggregate_type'].upper()}({view_entry['column']})"]
                else:
                    soql_queries += [f"SELECT {view_entry['column']}"]

                soql_query = ' |> ' .join(soql_queries)

                measure_list.append(f"`{escape_pipe(add_more_space_between_subqueries(soql_query))}`")
                
                if 'date' in _json_config:
                    soql_query = replace_global_date_variables(soql_query, default_start_date, default_end_date)

                measure_list.append(
                    md_link(f"https://{entry['dataset_domain']}/resource/{entry['dataset_id']}.json?$query=", query_param_to_encode=soql_query)
                )

                # only run performance tests if the flag is there
                if (performance_flag):
                    base_url = f"https://{entry['dataset_domain']}/resource/{entry['dataset_id']}.json?$query="
                    measure_list.append(test_query(base_url, soql_query))

            # Check for performance, flag, if so add a column to our table to list the results for each measure
            if (performance_flag):
                md_file.write(md_table(4, int(len(measure_list) / 4), measure_list))
            else:
                md_file.write(md_table(3, int(len(measure_list) / 3), measure_list))


# Start doing stuff here

parser = argparse.ArgumentParser()
parser.add_argument('--performance', '-p', action='store_true')
parser.add_argument('--all', '-a', action='store_true')
parser.add_argument('--input', '-i')
parser.add_argument('--output', '-o')


args = parser.parse_args()
performance_flag = args.performance

if not args.all:
    # check if input and output file are provided
    if not (args.input):
        print("Please provide an input file. Use the \"--input\" flag when calling the script.")
        quit()

output_file = args.output if args.output else "query_documentation.md"


SOCRATA_API_KEY = ''
if (performance_flag):
    if ("SOCRATA_API_KEY" in os.environ):
        SOCRATA_API_KEY = os.environ["SOCRATA_API_KEY"]
    else:
        print("Please enter your Socrata API Key in order to authenticate requests to non-public datasets:")
        SOCRATA_API_KEY = input()

    if ("SOCRATA_API_KEY_ID" in os.environ):
        SOCRATA_API_KEY_ID = os.environ["SOCRATA_API_KEY_ID"]
    else:
        print("Please enter your Socrata API Key ID in order to authenticate requests to non-public datasets:")
        SOCRATA_API_KEY_ID = input()

if (args.all):
    env_folder_list = ['rc', 'staging']
    root_dir = os.getcwd()
    if not os.path.isdir("docs"):
        os.mkdir("docs")
    for env_folder in env_folder_list:
        for dir_name, subdir_list, file_list in os.walk(f"{root_dir}/{env_folder}"):
            folder_name = dir_name.split("/")[-1]
            if folder_name in env_folder_list:
                if not os.path.isdir(f"docs/{folder_name}"):
                    os.mkdir(f"docs/{folder_name}")
                print(f"We're in: {dir_name}")
                for file_name in file_list:
                    if not is_file_empty(f"{dir_name}/{file_name}"):
                        with open(f"{dir_name}/{file_name}", 'r') as json_file:
                            try:
                                json_config = json.load(json_file)
                                parse_and_write_config(json_config, file_name, folder_name)
                                print(f"Wrote: {file_name}")
                            except:
                                print(f"Unable to parse: {file_name}")
else:
    with open(args.input, 'r') as json_file:
        print(f"Parsing {args.input}")
        try:
            json_config = json.load(json_file)
            parse_and_write_config(json_config, output_file)
        except:
            print(f"Unable to parse: {args.input}")                
