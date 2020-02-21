# Query Documentation Script

## About
A simple Python script to document how each of the measures on the solutions dashboard is calculated. The tool produces a markdown page for each solutions-config file in the `rc` and `staging` folders that provides: 
	* a quick rundown of the main dimensions on a dataset, 
	* the SoQL Query used to calculate each measure
	* and sample link showing the json output of the SoQL query in question. Still very much V0. 

Looking to add performance/timing functionality pretty soon help with performance testing.

## Running the script
*  Open the command line and navigate to the root directory of the repo:
*  Install dependencies: `pip install -r tools/requirements.text`

To document a single file use the --input and --output flags to indicate the input and output file locations. Make sure to give include `.md` as the file extension.
* `python tools/generate_query_doc.py --input staging/candj.staging-solutions.socrata-qa.com` --output `candj-staging-doc.md`

This will output a markdown file with the query documentations to the current directory. To test the query performance include the `--performance` flag. This will try each query and measure the time it takes for the query to complete. The results will be output into the markdown file.
* `python tools/generate_query_doc.py --input staging/candj.staging-solutions.socrata-qa.com` --output `candj-staging-doc.md` --performance

To run the script in order to document all of the config files in `rc` and `staging` include the `--all` flag:
* `python tools/generate_query_doc.py --all`

Likewise include the `--performance` flag to run a performance test on each of the queries.
* `python tools/generate_query_doc.py --all --performance`


Markdown files corresponding to each json config file should be found the `docs` directory.

## When to run
Run the script whenever you change one of the configuration files to get an updated markdown doc file.