{
  "branding": {
    "delimiter": ",",
    "browser_title": "Tyler EAM Executive Insights",
    "title": "Tyler EAM Executive Insights"
  },
  "date_options": {
    "type": "yearly",
    "default_year": "2020",
    "year_start_month": "7"
  },
  "tag_list": [
    "Assets",
    "Work Orders",
    "Service Requests"
  ],
  "show_share_via_email": true,
  "is_private": "false",
  "template_entries": [
    {
      "name": "Asset Inventory",
      "dataset_domain": "tyler.partner.socrata.com",
      "dataset_id": "y8d6-7pya",
      "fields": {
        "date_column": "last_updated_date",
        "incident_type": "assettype",
        "location": "geocoded_column"
      },
      "dimension_entries": [
        {
          "column": "assetcategory",
          "name": "Asset Category"
        },
        {
          "column": "administrativedepartment",
          "name": "Administrative Department"
        },
        {
          "column": "assettypedescription",
          "name": "Asset Type"
        },
        {
          "column": "assetdescription",
          "name": "Asset Description"
        },
        {
          "column": "assetcode",
          "name": "Asset Code"
        }
      ],
      "view_entries": [
        {
          "name": "Number of Assets In Service",
          "column": "assetid",
          "aggregate_type": "count",
          "prefix": "",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Financials"
          ],
          "quick_filters": [],
          "visualization": {
            "default_view": "snapshot",
            "overtime": {
              "show_area_chart": "false"
            }
          }
        }
      ],
      "leaf_page_entries": [
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "organization",
          "name": "Organisation"
        },
        {
          "column": "accountstatus",
          "name": "Account status"
        },
        {
          "column": "accounttype",
          "name": "Account type"
        }
      ],
      "map": {
        "centerLat": "41.7445544",
        "centerLng": "-88.1936202",
        "zoom": "12",
        "mini_map_zoom": "9",
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
      "quick_filter_entries": [
        {
          "column": "servicestatus",
          "name": "Service Status",
          "renderType": "text"
        }
      ]
    },
    {
      "name": "Work Orders",
      "description": "Work Orders",
      "dataset_domain": "tyler.partner.socrata.com",
      "dataset_id": "p82r-rswr",
      "fields": {
        "date_column": "openeddate",
        "incident_type": "activitymaintenancetypedesc",
        "location": "geocoded_column"
      },
      "dimension_entries": [
        {
          "column": "activitymaintenancetypedesc",
          "name": "Maintenance Type"
        },
        {
          "column": "servicingdepartment",
          "name": "Servicing Department"
        },
        {
          "column": "requestingdepartment",
          "name": "Requesting Department"
        },
        {
          "column": "statustext",
          "name": "Status"
        },
        {
          "column": "activitycode",
          "name": "Activity Code"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "days_open",
          "name": "Days Open",
          "renderType": "number"
        }
      ],
      "view_entries": [
        {
          "name": "Work Orders",
          "column": "workordernumber",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Work Orders"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barchart"
            }
          }
        },
        {
          "name": "Open Cases",
          "column": "codecaseid",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "end_date_override_and_ignore": "true",
          "start_date_boolean_override": "<",
          "parent_queries": [
            "select * where status = '5' OR where status = '2' OR where status = '4'"
          ],
          "tags": [
            "Code Enforcement"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barchart"
            }
          }
        }
      ],
      "leaf_page_entries": [
        {
          "column": "codecasetypename",
          "name": "Code Case Type"
        },
        {
          "column": "codecasestatusname",
          "name": "Code Case Status"
        },
        {
          "column": "districtname",
          "name": "District"
        },
        {
          "column": "projectname",
          "name": "Project"
        }
      ],
      "map": {
        "centerLat": "41.7445544",
        "centerLng": "-88.1936202",
        "zoom": "12",
        "mini_map_zoom": "9",
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
