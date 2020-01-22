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
      "dataset_domain": "elumitas.demo.socrata.com",
      "dataset_id": "qhb6-qezh",
      "default_view": "Snapshot",
      "fields": {
        "date_column": "applicationdate"
      },
      "dimension_entries": [
        {
          "column": "permittype",
          "name": "Permit Type"
        },
        {
          "column": "projectname",
          "name": "Project"
        },
        {
          "column": "permitworkclass",
          "name": "Permit Class"
        },
        {
          "column": "permitstatus",
          "name": "Permit Status"
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
          "color": "#abcdef",
          "operator": ">",
          "value": "30",
          "icon": "icons-check-circle"
        },
        {
          "name": "Off track",
          "color": "#110cde",
          "icon": "icons-times-circle"
        }
        ]
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
