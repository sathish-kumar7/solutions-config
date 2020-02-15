{
  "branding": {
    "browser_title": "Solutions | A&T ",
    "title": "Solutions - Tax and Appraisals",
    "delimiter": ","
  },
  "tag_list": [
    "Sales",
    "Appeals",
    "New Construction",
    "Commercial"
  ],
  "template_entries": [
    {
      "name": "Clermont County Property Data",
      "description": "Tax and Appraisals",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "n3pu-983n",
      "parent_queries": [
        "select * where sales_validity='0',
        "select *,avg(asr) over (partition by land_use_type='commercial') as median_asr, 1-asr/median_asr as asr_deviation_from_median"
      ],
      "fields": {
        "date_column": "saledt",
        "incident_type": "land_use_type",
        "location": "geocoded_column",
        "sua5-m9tm": "sua5_m9tm_objectid"
      },
      "dimension_entries": [
        {
          "column": "land_use_type",
          "name": "Land Use Type"
        },
        {
          "column": "style",
          "name": "Style"
        },
        {
          "column": "taxdist",
          "name": "Tax district"
        },
        {
          "column": "cityname",
          "name": "City"
        },
        {
          "column": "grade",
          "name": "Grade"
        },
        {
          "column": "stories",
          "name": "Stories"
        }
      ],
      "group_by_entries": [
        {
          "column": "cityname",
          "name": "City"
        },
        {
          "column": "land_use_type",
          "name": "Land Use Type"
        },
        {
          "column": "style",
          "name": "Style"
        },
        {
          "column": "taxdist",
          "name": "Tax district"
        },
        {
          "column": "grade",
          "name": "Grade"
        },
        {
          "column": "stories",
          "name": "Stories"
        }
      ],
      "view_entries": [
        {
          "name": "Average Sales Ratio",
          "column": "estimated_total_market_value/case(price <= 0 or price is null, case(estimated_total_market_value == 0, 1, true, estimated_total_market_value) , true, price)",
          "aggregate_type": "avg",
          "precision": "2",
          "prefix": "",
          "suffix": "",
          "use_dimension_value": "true",
          "tags": [
            "Sales"
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "show_scatterplot_range_bar": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "parid",
                    "name": "Number of Sales",
                    "aggregate_type": "count",
                    "prefix": "",
                    "suffix": "",
                    "precision": "0",
                    "render_type": "bullet"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "name": "1.0",
                    "value": "1"
                  }
                ]
              },
              "scatterplot": {
                "secondary_metric_entries": [
                  {
                    "column": "parid",
                    "name": "Number of sales",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": ""
                  }
                ],
                "default_secondary_metric": "Number of sales",
                "bench_mark_entries": [
                  {
                    "name": "1.0",
                    "value": "1"
                  }
                ]
              }
            }
          },
          "target_entries": [
            {
              "name": "Meets Standard",
              "color": "#259652",
              "operator": "<",
              "value": "1.2",
              "icon": "icons-check-circle"
            },
            {
              "name": "Does Not Meet Standard",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Average Absolute Deviation",
          "column": "asr_deviation_from_median",
          "aggregate_type": "avg",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Tax & Appraisals"
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "show_scatterplot_range_bar": "true"
            }
          }
        },
        {
          "name": "Coefficient of Dispersion",
          "column": "avg(asr_deviation_from_median)/avg(median_asr)",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Sales"
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            }
          }
        },
        {
          "name": "Price Relative Differential",
          "column": "avg(asr)/(   sum(estimated_total_market_value)/sum(price)    )",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Sales"
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "barchart": {
                "bench_mark_entries": [
                  {
                    "name": "Benchmark",
                    "value": "1"
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Median Ratio",
          "column": "estimated_total_market_value/case(price <= 0 or price is null, case(estimated_total_market_value == 0, 1, true, estimated_total_market_value) , true, price)",
          "aggregate_type": "avg",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Sales"
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "show_scatterplot_range_bar": "true"
            }
          }
        },
        {
          "name": "Estimated Total Market Value",
          "column": "estimated_total_market_value",
          "aggregate_type": "sum",
          "stack_column": "land_use_type",
          "precision": "0",
          "prefix": "$",
          "suffix": "",
          "tags": [
            "Sales"
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            }
          }
        },
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
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            }
          }
        }
      ],
      "filter_by_entries": [
        {
          "column": "style",
          "name": "style"
        },
        {
          "column": "com_use",
          "name": "Commercial Use Type"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "address",
          "name": "Address"
        },
        {
          "column": "style",
          "name": "Style"
        },
        {
          "column": "estimated_total_market_value",
          "name": "Estimated Total Market Value"
        },
        {
          "column": "tax_year",
          "name": "Tax Year"
        },
        {
          "name": "Ratio",
          "column": "estimated_total_market_value/case(price <= 0 or price is null, case(estimated_total_market_value == 0, 1, true, estimated_total_market_value) , true, price)"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "style",
          "name": "Style",
          "renderType": "text"
        },
        {
          "column": "asr",
          "name": "ASR",
          "renderType": "number"
        }
      ],
      "map": {
        "centerLat": "39.018425261608655",
        "centerLng": "-84.00102962486125",
        "zoom": "7",
        "mini_map_zoom": "7",
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
      "shape_dataset_entries": [
        {
          "shape_dataset_domain": "appraisalandtax.demo.socrata.com",
          "shape_dataset_id": "sua5-m9tm",
          "shape_name": "Clermont Township Boundaries",
          "fields": {
            "shape": "the_geom",
            "shape_id": "objectid",
            "shape_name": "name",
            "shape_description": "citycode"
          },
          "color": "#32a889"
        }
      ]
    },
    {
      "name": "Appeals",
      "description": "Tax and Appraisals",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "22ci-twx5",
      "parent_queries": [

      ],
      "fields": {
        "date_column": "decision_date",
        "incident_type": "own1"
      },
      "dimension_entries": [
        {
          "column": "class",
          "name": "Class"
        },
        {
          "column": "land_use_type",
          "name": "Land Use Type"
        },{
          "column": "com_use",
          "name": "Commercial Use Type"
        },{
          "column": "com_name",
          "name": "Commercial Description"
        },
        {
          "column": "heartyp",
          "name": "Hearing Type"
        },
        {
          "column": "attorney",
          "name": "Attorney"
        },
        {
          "column": "case_status",
          "name": "Case Status"
        },
        {
          "column": "reason_for_appeal",
          "name": "Reason For Appeal"
        }
      ],
      "group_by_entries": [

      ],
      "view_entries": [
        {
          "name": "% Appealed Value Upheld",
          "column": "(sum(decision_value) / sum(county_value))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Appeals"
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "true"
            }
          }
        },
        {
          "name": "Total Value Under Dispute",
          "column": "sum(county_value)-sum(taxpayer_opinion_value)",
          "aggregate_type": "",
          "precision": "0",
          "prefix": "$",
          "suffix": "",
          "tags": [
            "Appeals"
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "true"
            }
          }
        },
        {
          "name": "Average Value Under Dispute",
          "column": "avg(county_value-taxpayer_opinion_value)",
          "aggregate_type": "",
          "precision": "0",
          "prefix": "$",
          "suffix": "",
          "tags": [
            "Appeals"
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "true"
            }
          }
        },
        {
          "name": "Total Appeals",
          "column": "count(parid)",
          "aggregate_type": "",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Appeals"
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "true"
            }
          }
        }
      ],
      "leaf_page_entries": [
        {
          "column": "heartyp",
          "name": "Hearing Type"
        },
        {
          "column": "attorney",
          "name": "Attorney"
        },
        {
          "column": "case_status",
          "name": "Case Status"
        },
        {
          "column": "reason_for_appeal",
          "name": "Reason For Appeal"
        }
      ],
      "quick_filter_entries": [

      ],
      "bench_mark_entries": [

      ],
      "shape_dataset_entries": [

      ],
      "map": {
        "centerLat": "39.018425261608655",
        "centerLng": "-84.00102962486125",
        "zoom": "7",
        "mini_map_zoom": "7",
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
      "name": "New Construction",
      "description": "Tax and Appraisals",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "3sa7-53ay",
      "parent_queries": [

      ],
      "fields": {
        "date_column": "tax_year",
        "incident_type": "own1"
      },
      "dimension_entries": [
        {
          "column": "class",
          "name": "Class"
        },
        {
          "column": "land_use_code",
          "name": "Land Use Code"
        },
        {
          "column": "nbhd",
          "name": "Neighborhood"
        }
      ],
      "group_by_entries": [

      ],
      "view_entries": [
        {
          "name": "Total Parcels with New Construction",
          "column": "count(new_constr_amount)",
          "aggregate_type": "",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "New Construction"
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "true"
            }
          }
        },
        {
          "name": "Total Value of New Construction",
          "column": "sum(new_constr_amount)",
          "aggregate_type": "",
          "precision": "0",
          "prefix": "$",
          "suffix": "",
          "tags": [
            "New Construction"
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "true"
            }
          }
        }
      ],
      "leaf_page_entries": [
        {
          "column": "class",
          "name": "Class"
        },
        {
          "column": "land_use_code",
          "name": "Land Use Code"
        },
        {
          "column": "nbhd",
          "name": "Neighborhood"
        },
        {
          "column": "new_constr_amount",
          "name": "New Construction Value"
        }
      ],
      "quick_filter_entries": [

      ],
      "bench_mark_entries": [

      ],
      "shape_dataset_entries": [

      ],
      "map": {
        "centerLat": "39.018425261608655",
        "centerLng": "-84.00102962486125",
        "zoom": "7",
        "mini_map_zoom": "7",
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
      "name": "Comp Finder",
      "description": "Tax and Appraisals",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "3hre-b49k",
      "parent_queries": [

      ],
      "fields": {
        "date_column": "sale_date",
        "incident_type": "parcel_id"
      },
      "dimension_entries": [
        {
          "column": "county",
          "name": "County"
        },
        {
          "column": "land_use_code",
          "name": "Land Use Code"
        },
        {
          "column": "building_use",
          "name": "Building Use"
        }
      ],
      "group_by_entries": [
        {
          "column": "class",
          "name": "Class"
        },
        {
          "column": "land_use_code",
          "name": "Land Use Code"
        },
        {
          "column": "building_use",
          "name": "Building Use"
        }
      ],
      "view_entries": [
        {
          "name": "Comp Finder Fake Tile",
          "column": "parcel_id",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": " parcels to compare",
          "tags": [
            "Commercial"
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "true"
            }
          }
        }
      ],
      "leaf_page_entries": [
        {
          "column": "class",
          "name": "Class"
        },
        {
          "column": "land_use_code",
          "name": "Land Use Code"
        }
      ],
      "quick_filter_entries": [

      ],
      "bench_mark_entries": [

      ],
      "shape_dataset_entries": [

      ],
      "map": {
        "centerLat": "39.018425261608655",
        "centerLng": "-84.00102962486125",
        "zoom": "7",
        "mini_map_zoom": "7",
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
