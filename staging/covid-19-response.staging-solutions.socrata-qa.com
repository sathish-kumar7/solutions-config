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
    "startDate": "2000-1-1",
    "endDate": "2020-03-20"
  },
  "street_view_map_key": "AIzaSyB17sR2sKWfEcfsXwq_EKH4_J4DKuZ3y6I",
  "tag_list": [

  ],
  "template_entries": [
    {
      "name": "COVID-19 Response",
      "description": "",
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
          "column": "provider_organization_name",
          "name": "Organisation"
        }
      ],
      "view_entries": [
        {
          "name": "# of hospitals",
          "primary_metric name" : "Hospitals",    
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
            }
          }
        },
        {
          "name": "# of hospitals with GREEN Occupancy Health",
          "primary_metric name" : "Hospitals with green occupancy", 
          "parent_queries": [
    		"select * where occupancy_health = '1'"
		  ],
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
            }
          }
        },
        {
          "name": "# of hospitals with YELLOW Occupancy Health",
          "primary_metric name" : "Hospitals with yellow occupancy", 
          "parent_queries": [
        	"select * where occupancy_health = '2'"
		  ],
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
            }
          }
        },
        {
          "name": "# of hospitals with RED Occupancy Health",
          "primary_metric name" : "Hospitals with red occupancy", 
          "parent_queries": [
        	"select * where occupancy_health = '3'"
		  ],
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
            }
          }
        },
        {
          "name": "# of hospitals with GREEN Ventilator Health",
          "primary_metric name" : "Hospitals with red ventilator health", 
          "parent_queries": [
            "select * where ventilators_use_health = '1'"
		  ],
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
            }
          }
        },
        {
          "name": "# of hospitals with YELLOW Ventilator Health",
          "primary_metric name" : "Hospitals with red ventilator health", 
          "parent_queries": [
            "select * where ventilators_use_health = '2'"
		  ],
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
            }
          }
        },
        {
          "name": "# of hospitals with RED Ventilator Health",
          "primary_metric name" : "Hospitals with red ventilator health", 
          "parent_queries": [
            "select * where ventilators_use_health = '3'"
		  ],
          "column": "npi",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hospitals",
          "tags": [
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
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
        "centerLat": "39.20465469073116",
        "centerLng": "-95.82864859440542,",
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
