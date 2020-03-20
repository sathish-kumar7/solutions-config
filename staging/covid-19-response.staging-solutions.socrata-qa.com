{
  "application_use": "demo",
  "branding": {
    "browser_title": "COVID-19 Response",
    "title": "COVID-19 Response",
    "delimiter": ","
  },
    "exploration_card_entries": [
    {
      "name": "CC - Covid-19 Response",
      "link": " covid-19-beds.projects.socrata.com",
      "exploration_content": "COVID-19 Response"
    }
  ],
  "date": {
    "startDate": "2019-1-1",
    "endDate": "2020-03-20"
  },
  "street_view_map_key": "AIzaSyB17sR2sKWfEcfsXwq_EKH4_J4DKuZ3y6I",
  "tag_list": [

  ],
  "template_entries": [
    {
      "name": "COVID-19 Response",
      "description": "COVID-19 Response",
      "dataset_domain": "covid-19-response.demo.socrata.com",
      "dataset_id": "6ide-cs9c",
      "parent_queries": [

      ],
      "fields": {
        "date_column": "last_update_date",
        "incident_type": "classification",
        "location": "geocoded_column"
      },
      "dimension_entries": [
        {
          "column": "classification",
          "name": "Classification"
        },
        {
          "column": "provider_organisation_name",
          "name": "Organisation"
        }
      ],
      "view_entries": [
        {
          "name": "Total Sales",
          "column": "saledt",
          "aggregate_type": "count",
          "stack_column": "land_use_type",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Sales"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            }
          }
        }
      ],
      "filter_by_entries": [
      ],
      "leaf_page_entries": [
      ],
      "quick_filter_entries": [

      ],
      "map": {
        "centerLat": "33.9608276,",
        "centerLng": "-84.5699291",
        "zoom": "9",
        "mini_map_zoom": "8.5",
        "shapes_outline_highlight_width": "2",
        "shapes_outline_width": "1.5",
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
      "shape_dataset_entries": [

      ]
    }
]
}
