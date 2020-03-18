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
        "location": "new_georeferenced_column"
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
    }
  ]
}
