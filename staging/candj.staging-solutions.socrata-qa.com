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
          "name": "Count of Cases",
          "column": "caseid",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "tags": [
            "Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#110cde",
              "operator": ">",
              "value": "120000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
          "default_view": "Snapshot",
            "snapshot": {
                "chart_type": "groupChart"
            }
         }
        },
        {
          "name": "Q3 2006 Clearance Rate",
          "column": "(sum(closed)/case(sum(opened) == 0, 1, true, sum(opened))*100)",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "name_1": "Count of cases",
          "column_1": "caseid",
          "aggregate_type_1": "count",
          "tags": [
            "Clearance Rates"
          ],
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
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#110cde",
              "operator": ">=",
              "value": "100",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
          "default_view": "Snapshot",
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
    },
    {
      "name": "Courts Operations",
      "dataset_domain": "courtsandjustice.demo.socrata.com",
      "dataset_id": "6nic-t5bv",
      "default_view": "Snapshot",
      "fields": {
        "date_column": "hearingdate"
      },
      "parent_queries": [
        "select *, count(hearingdate) as total_hearing_dates, min(hearingdate) as first_hearing, max(hearingdate) as last_hearing, count (casenumber) as total_cases"
      ],
      "dimension_entries": [
        {
          "column": "casetypedescription",
          "name": "Case Type Description"
        },
        {
          "column": "casecategorydescription",
          "name": "Case Category Description"
        },
        {
          "column": "casecategorymappingdescription",
          "name": "Case Category Mapping Description"
        },
        {
          "column": "hearingtypedescription",
          "name": "Hearing Type"
        }
      ],
      "view_entries": [
        {
          "name": "Case Certainity",
          "column": "(case(total_hearing_dates < 3, 1, total_hearing_dates >= 3, 0)) /total_cases",
          "aggregate_type": "sum",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Cases"
          ],
       "visualization": {
          "default_view": "Snapshot",
            "snapshot": {
                "chart_type": "barChart"
            }
        },
        "target_entries": [
        {
          "name": "On track",
          "color": "#110cde",
          "operator": ">",
          "value": "30",
          "icon": "icons-check-circle"
        },
        {
          "name": "Off track",
          "color": "#e31219",
          "icon": "icons-times-circle"
        }
        ]
        }
      ],
      "leaf_page_entries": [
        {
          "column": "casetypedescription",
          "name": "Case Type Description"
        },
        {
          "column": "casecategorydescription",
          "name": "Case Category Description"
        },
        {
          "column": "casecategorymappingdescription",
          "name": "Case Category Mapping Description"
        },
        {
          "column": "hearingtypedescription",
          "name": "Hearing Type"
        }   
      ],
      "map": {
        "centerLat": "42.038333",
        "centerLng": "-88.322778",
        "zoom": "10",
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
      }
    }
  ]
}
