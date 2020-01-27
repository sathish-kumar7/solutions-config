JSON Blob
 New
 Save
 Clear
 Make Request
 Create Gist
 Tour
 About
 API
powered by ace

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
{
  "branding": {
    "browser_title": "Solutions | QA ",
    "title": "Solutions - QA"
  },
  "tag_list": [
    "Cases",
    "Judges",
    "Clearence rates",
    "Districts and counties"
  ],
  "show_share_via_email": "false",
  "is_private": "false",
  "template_entries": [
    {
      "name": "Opex Budget",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "s8xp-hq5q",
      "fields": {
        "date_column": "fiscal_year"
      },
      "dimension_entries": [
        {
          "column": "service",
          "name": "Service"
        },
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "program",
          "name": "Program"
        },
        {
          "column": "category",
          "name": "Category"
        }
      ],
      "view_entries": [
        {
          "name": "Funds",
          "column": "entry_type",
          "aggregate_type": "count",
          "visualization": {
            "default_view": "Snapshot"
          },
          "precision": "0",
          "prefix": "",
          "suffix": "funds",
          "tags": [
            "Cases",
            "Clearence rates"
          ],

	
	
	
	object		{5}
		
	branding		{2}
		
	tag_list		[4]
		
show_share_via_email	:	false
		
is_private	:	false
		
	template_entries		[9]
© 2020 Tristan Burch

Fork me on GitHub
