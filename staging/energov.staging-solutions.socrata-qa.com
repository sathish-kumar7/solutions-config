{
  "branding": {
    "browser_title": "Solutions | EnerGov ",
    "title": "Solutions - EnerGov"
  },
  "tag_list": [
    "Community Development",
    "Business Services",
    "Code Enforcement"
  ],
  "show_share_via_email": true,
  "is_private": "false",
  "template_entries": [
    {
      "name": "Community Development",
      "dataset_domain": "tyler.partner.socrata.com",
      "dataset_id": "amhj-22i6",
      "default_view": "Snapshot",
      "fields": {
        "date_column": "applicationdate"
      },
      "dimension_entries": [
        {
          "column": "projectname",
          "name": "Project"
        },
        {
          "column": "permitstatus",
          "name": "Permit Status"
        },
        {
          "column": "permitworkclass",
          "name": "Permit Class"
        },
        {
          "column": "permittype",
          "name": "Permit Type"
        }
      ],
      "group_by_entries": [
        {
          "column": "district",
          "name": "District"
        }
      ],
      "view_entries": [
        {
          "name": "Permits Issued",
          "column": "permitid",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "permits",
          "tags": [
            "Community Development"
          ],
       "visualization": {
          "default_view": "Snapshot",
            "snapshot": {
                "chart_type": "groupChart"
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
          "column": "projectname",
          "name": "Project"
        },
        {
          "column": "permitstatus",
          "name": "Permit Status"
        },
        {
          "column": "permitworkclass",
          "name": "Permit Class"
        },
        {
          "column": "permittype",
          "name": "Permit Type"
        },
        {
          "column": "district",
          "name": "District"
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
    },
        {
      "name": "Code Enforcement",
      "dataset_domain": "tyler.partner.socrata.com",
      "dataset_id": "vnvd-qqjp",
      "default_view": "Snapshot",
      "fields": {
        "date_column": "requestdatetime"
      },
      "dimension_entries": [
        {
          "column": "inspectiontypename",
          "name": "Inspection"
        },
        {
          "column": "inspectionstatusname",
          "name": "Inspection Status"
        },
        {
          "column": "inspectionlinktypename",
          "name": "Inspection Link Name"
        },
        {
          "column": "balancedue",
          "name": "Balance due"
        }
      ],
      "view_entries": [
        {
          "name": "Inspections",
          "column": "inspectionid",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "inspections",
          "tags": [
            "Code Enforcement"
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
          "column": "inspectiontypename",
          "name": "Inspection"
        },
        {
          "column": "inspectionstatusname",
          "name": "Inspection Status"
        },
        {
          "column": "inspectionlinktypename",
          "name": "Inspection Link Name"
        },
        {
          "column": "balancedue",
          "name": "Balance due"
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
    },
    {
      "name": "Business Services",
      "dataset_domain": "tyler.partner.socrata.com",
      "dataset_id": "sb4f-xivi",
      "default_view": "Snapshot",
      "fields": {
        "date_column": "applicationdate"
      },
      "dimension_entries": [
        {
          "column": "companyname",
          "name": "Company"
        },
        {
          "column": "licensestatus",
          "name": "License Status"
        },
        {
          "column": "licenseclass",
          "name": "License Class"
        },
        {
          "column": "licensetype",
          "name": "License Type"
        }
      ],
      "group_by_entries": [
        {
          "column": "district",
          "name": "District"
        }
      ],
      "view_entries": [
        {
          "name": "License Applications",
          "column": "licenseid",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "Licenses",
          "tags": [
            "Business Services"
          ],
       "visualization": {
          "default_view": "Snapshot",
            "snapshot": {
                "chart_type": "groupChart"
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
          "column": "companyname",
          "name": "Company"
        },
        {
          "column": "licensestatus",
          "name": "License Status"
        },
        {
          "column": "licenseclass",
          "name": "License Class"
        },
        {
          "column": "licensetype",
          "name": "License Type"
        },
        {
          "column": "district",
          "name": "District"
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
