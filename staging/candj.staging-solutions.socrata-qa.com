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
         },
         "comparison_column_entires": [
              {
              "column": "caseid",
              "name": "Count of cases",
              "aggregate_type": "count",
              "prefix": "",
              "suffix": "cases",
              "precision": "0",
              "render_type": "bullet"
              }
           ]
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
        "select count(hearingdate) as total_hearing_dates, casenumber, min(hearingdate) as first_hearing, max(hearingdate) as last_hearing, min(casetypedescription) as case_type_description, min(casecategorydescription) as case_category_description, min(casecategorymappingdescription) as case_category_mapping_description group by casenumber |> select total_hearing_dates,casenumber, first_hearing, last_hearing, case_type_description, case_category_description, case_category_mapping_description, case(total_hearing_dates < 3, 1, total_hearing_dates >= 3, 0) as certainity_count"
      ],
      "dimension_entries": [
        {
          "column": "case_type_description",
          "name": "Case Type Description"
        },
        {
          "column": "case_category_description",
          "name": "Case Category Description"
        },
        {
          "column": "case_category_mapping_description",
          "name": "Case Category Mapping Description"
        }
      ],
      "view_entries": [
        {
          "name": "Trial Certainity",
          "column": "sum(certainity_count)/count(*)",
          "aggregate_type": "",
          "precision": "1",
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
        }
        }
      ],
      "leaf_page_entries": [
        {
          "column": "case_type_description",
          "name": "Case Type Description"
        },
        {
          "column": "case_category_description",
          "name": "Case Category Description"
        },
        {
          "column": "case_category_mapping_description",
          "name": "Case Category Mapping Description"
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
