{
  "branding": {
    "browser_title": "Solutions | C&J ",
    "title": "Solutions - Courts and Justice"
  },
  "tag_list": [
    "Clearance Rates",
    "Cases"
  ],
  "template_entries": [
    {
      "name": "Courts and Justice",
      "description": "",
      "dataset_domain": "courtsandjustice.demo.socrata.com",
      "dataset_id": "mhwy-h4pu",
      "default_view": "Snapshot",
      "fields": {
        "date_column": "statusdate",
        "incident_type": "casetypecodedescription",
        "location": "geocoded_column"
      },
      "dimension_entries": [
        {
          "column": "judgename",
          "name": "Judge"
        },
        {
          "column": "casetypecode",
          "name": "Case Type Code"
        },
        {
          "column": "zipcode",
          "name": "Zip Code"
        }
      ],
      "group_by_entries": [
        {
          "column": "nodename",
          "name": "Court Name"
        }
      ],
      "view_entries": [
        {
          "name": "Q3 2006 Clearance Rate",
          "column": "(sum(closed)/case(sum(opened) == 0, 1, true, sum(opened))*100)",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Clearance Rates"
          ],
          "visualization": {
              "snapshot": {
                  "chart_type": "groupChart"
                }
            },
          "quick_filters": [
            {
             "column": "statusdate",
             "type": "date",
             "field": "quick_filter_0_mhwy_h4pu_0",
             "dateRange": {
                "start_date": "2006-07-01",
                "end_date": "2006-09-30"
                }
            }
          ]
        },
        {
          "name": "Count of Cases",
          "column": "caseid",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Cases"
          ],
          "visualization": {
              "snapshot": {
                  "chart_type": "groupChart"
                }
          }
        }
      ],
      "filter_by_entries": [
        {
          "column": "judgename",
          "name": "Judge"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "judgename",
          "name": "Judge"
        },
        {
          "column": "caseid",
          "name": "Case ID"
        },
        {
          "column": "statusdate",
          "name": "Status Date"
        },
        {
          "column": "opened",
          "name": "Opened"
        },
        {
          "column": "closed",
          "name": "Closed"
        },
        {
          "column": "nodename",
          "name": "Court Name"
        },
        {
          "column": "zipcode",
          "name": "Zip Code"
        },
        {
          "column": "casetypecode",
          "name": "Case Type Code"
        },
        {
          "column": "casetypecodedescription",
          "name": "Case Description"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "statusdate",
          "name": "Status Date",
          "renderType": "date"
        }
      ],
      "bench_mark_entries": [
        {
          "view_column": "caseid",
          "dimension_column": "judgename",
          "display_name": "State Standard",
          "value": "100"
        }
      ],
      "map": {
        "centerLat": "44.40861110588011",
        "centerLng": "-115.16737594966821",
        "zoom": "3",
        "shapes_outline_highlight_width": "4",
        "style_entries": [
          {
            "name": "Street",
            "style": "mapbox://styles/mapbox/streets-v10"
          },
          {
            "name": "Light",
            "style": "mapbox://styles/mapbox/light-v9"
          },
          {
            "name": "Dark",
            "style": "mapbox://styles/mapbox/dark-v9"
          },
          {
            "name": "Satelite",
            "style": "mapbox://styles/mapbox/satellite-v9"
          },
          {
            "name": "Outdoors",
            "style": "mapbox://styles/mapbox/outdoors-v10"
          }
        ]
      },
      "shape_dataset_entries": [],
      "shape_outline_dataset_entries": []
    }
  ]
}
