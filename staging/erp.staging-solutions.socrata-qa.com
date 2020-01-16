{
  "branding": {},
  "template_entries": [
    {
      "name": "Opex Budget",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "s8xp-hq5q",
      "default_view": "Snapshot",
      "visualization": {
        "snapshot": {
          "chart_type": "groupChart"
        }
      },
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
      "group_by_entries": [
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "fiscal_year",
          "name": "Year"
        }
      ],
      "view_entries": [
        {
          "name": "Funds",
          "column": "entry_type",
          "aggregate_type": "count",
          "stack_column": "entry_type"
        },
        {
          "name": "Total amount spent",
          "column": "actual_amount",
          "aggregate_type": "sum",
          "stack_column": "entry_type"
        },
        {
          "name": "Total amount approved",
          "column": "approved_amount",
          "aggregate_type": "sum",
          "use_dimension_value": "true"
        }
      ],
      "filter_by_entries": [
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "fiscal_year",
          "name": "Year"
        }
      ],
      "leaf_page_entries": [
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
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "category",
          "name": "Category"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "service",
          "name": "Service",
          "renderType": "text"
        },
        {
          "column": "department",
          "name": "Department",
          "renderType": "text"
        },
        {
          "column": "program",
          "name": "Program",
          "renderType": "text"
        },
        {
          "column": "fund",
          "name": "Fund",
          "renderType": "number"
        },
        {
          "column": "category",
          "name": "Category",
          "renderType": "text"
        }
      ],
      "map": {
        "centerLat": "38.760910",
        "centerLng": "-121.302611",
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
      },
      "shape_datasets": [
        {
          "shape_dataset_domain": "tylertech.demo.socrata.com",
          "shape_name": "Elgin Police Beats",
          "dataset_id": "r52y-uc86",
          "fields": {
            "shape": "multipolygon",
            "shape_id": "_feature_id"
          },
          "color": "#ffff66"
        }
      ],
      "shape_outline_dataset_entries": [
        {
          "shape_outline_dataset_domain": "rosevillepd.data.socrata.com",
          "outline_name": "Beats",
          "shape_outline_dataset_id": "ujv7-87d7",
          "fields": {
            "shape": "the_geom"
          },
          "color": "#d73b70",
          "show_by_default": "true"
        },
        {
          "shape_outline_dataset_domain": "rosevillepd.data.socrata.com",
          "outline_name": "Parks & Recreation",
          "shape_outline_dataset_id": "pn3p-r56a",
          "fields": {
            "shape": "the_geom"
          },
          "color": "#0b19b3",
          "show_by_default": "false"
        },
        {
          "shape_outline_dataset_domain": "rosevillepd.data.socrata.com",
          "outline_name": "City Boundary",
          "shape_outline_dataset_id": "79cn-t7i2",
          "fields": {
            "shape": "the_geom"
          },
          "color": "#299c0c",
          "show_by_default": "false"
        }
      ]
    },
    {
      "name": "Opex Revenue",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "mik7-qbhe",
      "default_view": "Over Time",
      "fields": {
        "date_column": "fiscal_year"
      },
      "dimension_entries": [
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "source",
          "name": "Source"
        }
      ],
      "view_entries": [
        {
          "name": "Total Revenue",
          "column": "actual_amount",
          "aggregate_type": "sum"
        },
        {
          "name": "Total Projections",
          "column": "projected_amount",
          "aggregate_type": "sum"
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
      "name": "Capex Budget",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "dszp-jd2s",
      "default_view": "Pie Chart",
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
          "column": "project",
          "name": "Project"
        }
      ],
      "view_entries": [
        {
          "column": "approved_amount",
          "name": "Approved Amount",
          "aggregate_type": "sum"
        },
        {
          "column": "actual_amount",
          "name": "Actual Amount",
          "aggregate_type": "sum"
        }
      ],
      "map": {
        "centerLat": "38.760910",
        "centerLng": "-121.302611",
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
      "name": "Payroll",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "qu7r-i9cv",
      "default_view": "Scatterplot",
      "fields": {
        "date_column": "fiscal_year"
      },
      "dimension_entries": [
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "position_title",
          "name": "Job"
        },
        {
          "column": "position_type",
          "name": "Position Type"
        }
      ],
      "view_entries": [
        {
          "name": "Annual Total",
          "column": "pay_total",
          "aggregate_type": "sum"
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
