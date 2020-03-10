{
  "branding": {
    "browser_title": "Portland Assessment Connect",
    "title": "City of Portland Assessment Connect",
    "delimiter": ","
  },
  "date": {
    "startDate": "2017-2-18",
    "endDate": "2020-02-18"
  },
  "tag_list": [
    "Sales",
    "Appeals",
    "New Construction",
    "CompFinder"
  ],
  "template_entries": [
    {
      "name": "City of Portland Property Data",
      "description": "Sales",
      "dataset_domain": "portlandme.data.socrata.com",
      "dataset_id": "kx7n-ab4t",
      "parent_queries": [
        "select *,avg(sale_ratio) over (partition by land_use_code) as median_sale_ratio, 1-sale_ratio/median_sale_ratio as sale_ratio_deviation_from_median"
      ],
      "fields": {
        "date_column": "sale_date",
        "incident_type": "land_use_code",
        "location": "geocoded_column"
      },
      "dimension_entries": [
        {
          "column": "class_desc",
          "name": "Class"
        },{
          "column": "luc_desc",
          "name": "Land Use Type"
        },
        {
          "column": "style_desc",
          "name": "Style"
        },
        {
          "column": "grade_desc",
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
          "column": "luc_desc",
          "name": "Land Use Type"
        },
        {
          "column": "style_desc",
          "name": "Style"
        },
        {
          "column": "grade_desc",
          "name": "Grade"
        },
        {
          "column": "stories",
          "name": "Stories"
        }
      ],
      "view_entries": [
        {
          "name": "Estimated Total Market Value",
          "column": "appr_total",
          "aggregate_type": "sum",
          "stack_column": "land_use_code",
          "precision": "0",
          "prefix": "$",
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
        },{
          "name": "Average Sales Ratio",
          "column": "appr_total/case(sale_price <= 0 or sale_price is null, case(appr_total == 0, 1, true, appr_total) , true, sale_price)",
          "aggregate_type": "avg",
          "precision": "2",
          "prefix": "",
          "suffix": "",
          "use_dimension_value": "true",
          "tags": [
            "Sales"
          ],
          "parent_queries": [
        "select * where sale_validity = '0'"

      ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "default_view": "scatterplot",
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "show_scatterplot_range_bar": "true",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "parcel_id",
                    "name": "Number of Sales",
                    "aggregate_type": "count",
                    "prefix": "",
                    "suffix": "",
                    "precision": "0",
                    "render_type": "bullet",
                    "independent_axes_values": "true"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "name": "Benchmark",
                    "value": "1"
                  },
                  {
                    "name": "20% Variance",
                    "value": "1.2",
                    "value1": "0.8"
                  }
                ]
              },
              "scatterplot": {
                "default_show_range": "true",
                "secondary_metric_entries": [
                  {
                    "column": "parcel_id",
                    "name": "Number of sales",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": ""
                  }
                ],
                "default_bench_mark": "20% Variance",
                "default_secondary_metric": "Number of sales",
                "bench_mark_entries": [
                  {
                    "name": "Benchmark",
                    "value": "1"
                  },
                  {
                    "name": "10% Variance",
                    "value": "1.1",
                    "value1": "0.9"
                  }
                ]
              }
            }
          },
          "target_entries": [
            {
              "name": "Meets Standard",
              "color": "#259652",
              "operator": "between",
              "value": "0.9",
              "to": "1.1",
              "icon": "icons-check-circle",
              "target_entry_description": "This metric meets the IAAO standard. The standard is between 0.9 and 1.1."
            },
            {
              "name": "Does Not Meet Standard",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "This metric does not meet the IAAO standard. The standard is between 0.9 and 1.1."
            }
          ]
        },
        {
          "name": "Total Sales",
          "column": "sale_date",
          "aggregate_type": "count",
          "stack_column": "land_use_code",
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
        },
        {
          "name": "Coefficient of Dispersion",
          "column": "avg(sale_ratio_deviation_from_median)/avg(median_sale_ratio)",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "2",
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
        },
        {
          "name": "Price Relative Differential",
          "column": "avg(sale_ratio)/(   sum(sale_appr_value)/sum(sale_price)    )",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Sales"
          ],
          "visualization": {
            "default_view": "snapshot",
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
          "name": "Average Absolute Deviation",
          "column": "sale_ratio_deviation_from_median",
          "aggregate_type": "avg",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Tax & Appraisals"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "show_scatterplot_range_bar": "true"
            }
          }
        },
        {
          "name": "Median Ratio",
          "column": "sale_appr_value/case(sale_price <= 0 or sale_price is null, case(sale_appr_value == 0, 1, true, sale_appr_value) , true, sale_price)",
          "aggregate_type": "avg",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Sales"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true",
              "show_scatterplot_range_bar": "true"
            }
          }
        },{
          "name": "% Parcels Sold",
          "column": "(sum(has_sold)/count(*))::double*100",
          "aggregate_type": "",
          "stack_column": "land_use_code",
          "precision": "0",
          "prefix": "",
          "suffix": "%",
          "end_date_override_and_ignore":"true",
          "start_date_override_and_ignore":"true",
          "tags": [
            "Sales"
          ],
          "visualization": {
            "default_view": "map",
            "map": {
                "default_view": "choropleth"
            },
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            }
          },
          "parent_queries": [
            "select *, :@computed_region_52nt_trix, case(sale_date between {START_DATE} and {END_DATE} ,1,true,0) as has_sold"
          ]
        }
      ],
      "filter_by_entries": [
        {
          "column": "style",
          "name": "style"
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
          "column": "sale_appr_value",
          "name": "Estimated Total Market Value"
        },
        {
          "column": "tax_year",
          "name": "Tax Year"
        },
        {
          "name": "Ratio",
          "column": "sale_appr_value/case(sale_price <= 0 or sale_price is null, case(sale_appr_value == 0, 1, true, sale_appr_value) , true, sale_price)"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "style",
          "name": "Style",
          "renderType": "text"
        },
        {
          "column": "appr_total/case(sale_price <= 0 or sale_price is null, case(appr_total == 0, 1, true, appr_total) , true, sale_price)",
          "name": "Sale Ratio",
          "renderType": "number"
        }
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
        {
          "shape_dataset_domain": "appraisalandtax.demo.socrata.com",
          "shape_dataset_id": "sua5-m9tm",
          "shape_name": "Cobb County City Boundaries",
          "fields": {
            "shape": "the_geom",
            "shape_id": "objectid",
            "shape_name": "name",
            "shape_description": "citycode"
          },
          "color": "#32a889",
          "border_color": "#cccccc",
          "mini_map_border_color": "#4d4e4f",
          "outline_highlight_color": "#808080"
        },
        {
          "shape_dataset_domain": "appraisalandtax.demo.socrata.com",
          "shape_dataset_id": "52nt-trix",
          "shape_name": "County Commission Districts",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "commission"
          },
          "color": "#32a889",
          "border_color": "#cccccc",
          "mini_map_border_color": "#4d4e4f",
          "outline_highlight_color": "#808080"
        }
      ]
    }
  ]
}
