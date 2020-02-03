{
  "branding": {
    "browser_title": "Solutions | QA ",
    "title": "Solutions - QA"
  },
  "tag_list": [
    "Cases",
    "Judges",
    "Clearence rates",
    "Districts and counties"
  ],
  "show_share_via_email": "false",
  "is_private": "false",
  "date": {
      "startDate": "2019-10-01",
      "endDate": "2019-12-31"
  },
  "template_entries": [
    {
      "name": "Opex Budget",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "s8xp-hq5q",
      "fields": {
        
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
      "view_entries": [
        {
          "name": "Funds",
          "column": "entry_type",
          "aggregate_type": "count",
          "visualization": {
            "default_view": "Snapshot",
             "snapshot": {
                "show_pie_chart": "true"
            }
          },
          "precision": "0",
          "prefix": "",
          "suffix": "funds",
          "tags": [
            "Cases",
            "Clearence rates"
          ],
          "comparison_column_entries": [
            {
              "column": "department",
              "name": "Department",
              "aggregate_type": "count",
              "render_type": "bar",
              "precision": "0",
              "prefix": "",
              "suffix": "departments"
            },
            {
              "column": "program",
              "name": "Program",
              "aggregate_type": "",
              "render_type": "stack",
              "precision": "0",
              "prefix": "",
              "suffix": ""
            },
            {
              "column": "category",
              "name": "Category",
              "aggregate_type": "count",
              "render_type": "bullet",
              "precision": "0",
              "prefix": "",
              "suffix": "categories"
            }
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "between",
              "value": "30000",
              "to": "100000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Total amount spent",
          "column": "actual_amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "suffix": "Total",
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
                "show_pie_chart": "true"
            }
          },
          "comparison_column_entries": [
            {
              "column": "approved_amount",
              "name": "Approved Amount",
              "aggregate_type": "sum",
              "render_type": "bullet",
              "precision": "2",
              "prefix": "$",
              "suffix": "Approved"
            },
            {
              "column": "recommneded_amount",
              "name": "Recommended Amount",
              "aggregate_type": "sum",
              "render_type": "bullet",
              "precision": "2",
              "prefix": "$",
              "suffix": "Recommended"
            }
          ],
          "quick_filters": [
            {
              "column": "program",
              "type": "text",
              "field": "quick_filter_0_s8xp_hq5q_2",
              "values": [
                "a"
              ],
              "operator": "like"
            }
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "between",
              "value": "30000",
              "to": "100000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Amount spent on Salary And Wages",
          "column": "actual_amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "visualization": {
            "default_view": "Pie Chart",
            "snapshot": {
                "show_pie_chart": "true"
            }
          },
          "quick_filters": [
            {
              "column": "category",
              "type": "text",
              "field": "quick_filter_0_s8xp_hq5q_4",
              "values": [
                "Salary and Wages"
              ],
              "operator": "="
            }
          ]
        },
        {
          "name": "Total amount approved",
          "column": "approved_amount",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
          "visualization": {
            "default_view": "Over Time"
          },
          "prefix": "$",
          "precision": "2"
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
        },
        {
          "column": "fiscal_year",
          "name": "Year"
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
          "renderType": "text"
        },
        {
          "column": "category",
          "name": "Category",
          "renderType": "text"
        },
        {
          "column": "fiscal_year",
          "name": "Year",
          "renderType": "number"
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
      "fields": {
       
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
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "visualization": {
            "default_view": "Snapshot"
          },
          "comparison_column_entries": [
            {
              "column": "recommneded_amount",
              "name": "Recommended Amount",
              "aggregate_type": "sum",
              "render_type": "bullet",
              "precision": "2",
              "prefix": "$",
              "suffix": "Recommended"
            },
            {
              "column": "actual_amount",
              "name": "Actual Amount",
              "aggregate_type": "sum",
              "render_type": "bullet",
              "precision": "2",
              "prefix": "$",
              "suffix": "Actual"
            }
          ],
          "tags": [
            "Cases",
            "Judges"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "between",
              "value": "30000",
              "to": "100000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Total Projections",
          "column": "projected_amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "dollar",
          "visualization": {
            "default_view": "Scatterplot"
          },
          "precision": "2"
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
      "fields": {
        
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
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "visualization": {
            "default_view": "Pie Chart"
          },
          "tags": [
            "Cases",
            "Clearence rates"
          ],
          "comparison_column_entries": [
            {
              "column": "actual_amount",
              "name": "Actual Amount",
              "aggregate_type": "sum",
              "render_type": "bullet",
              "precision": "2",
              "prefix": "$",
              "suffix": "Actual"
            }
          ]
        },
        {
          "column": "actual_amount",
          "name": "Actual Amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "visualization": {
            "default_view": "Pie Chart"
          },
          "tags": [
            "Cases",
            "Judges"
          ]
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
      "fields": {
        
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
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2",
          "tags": [
            "Cases",
            "Districts and counties"
          ],
          "visualization": {
            "default_view": "Scatterplot"
          }
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
      "name": "Cobb-Dekalb-Fulton",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "3hre-b49k",
      "fields": {
        "date_column": "tax_year",
        "incident_type": "class",
        "location": "geocoded_column",
        "73f8-h8ah": ":@computed_region_73f8_h8ah"
      },
      "dimension_entries": [
        {
          "column": "class",
          "name": "Class"
        },
        {
          "column": "owner",
          "name": "Owner"
        }
      ],
      "group_by_entries": [
        {
          "column": "county",
          "name": "County"
        },
        {
          "column": "year_built_1",
          "name": "Year"
        }
      ],
      "view_entries": [
        {
          "name": "Mean ratio",
          "column": "(market_total/case(sale_price == 0,1, true, sale_price))",
          "aggregate_type": "avg",
          "precision": "2",
          "tags": [
            "Cases",
            "Districts and counties"
          ],
          "visualization": {
            "default_view": "Map",
            "snapshot": {
              "chart_type": "groupChart"
            }
          },
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "==",
              "value": "30000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Sales",
          "column": "sale_type",
          "aggregate_type": "count",
          "stacked_column": "sale_type",
          "precision": "",
          "tags": [
            "Cases",
            "Districts and counties"
          ],
          "visualization": {
            "default_view": "Map",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Building value",
          "column": "building_value",
          "aggregate_type": "sum",
          "precision": "2",
          "prefix": "$",
          "visualization": {
            "default_view": "Over Time",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        }
      ],
      "filter_by_entries": [
        {
          "column": "year_built_1",
          "name": "Year"
        },
        {
          "column": "owner",
          "name": "Owner"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "class",
          "name": "Class"
        },
        {
          "column": "building_value",
          "name": "Building value"
        },
        {
          "column": "county",
          "name": "County"
        },
        {
          "column": "cityname",
          "name": "City"
        },
        {
          "column": "year_built_1",
          "name": "Year"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "sale_date",
          "name": "Sales date",
          "renderType": "date"
        }
      ],
      "map": {
        "centerLat": "32.20410409773211",
        "centerLng": "-82.38302461163329",
        "zoom": "5",
        "mini_map_zoom": "4",
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
          "shape_dataset_id": "73f8-h8ah",
          "shape_name": "State of Georgia",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "name",
            "shape_description": "name"
          },
          "color": "#32a889"
        }
      ]
    },
    {
      "name": "Incidents Data",
      "dataset_domain": "pinellasparkpd.data.socrata.com",
      "dataset_id": "qs3a-3222",
      "fields": {
        "date_column": "reported_date_time",
        "incident_type": "occurred_incident_type",
        "location": "location",
        "hmbv-vp9r": ":@computed_region_hmbv_vp9r",
        "ntia-f3vs": ":@computed_region_ntia_f3vs",
        "xx7z-z9ah": ":@computed_region_xx7z_z9ah",
        "f3c4-j5m5": ":@computed_region_f3c4_j5m5"
      },
      "dimension_entries": [
        {
          "column": "case_disposition",
          "name": "Disposition"
        },
        {
          "column": "reporting_officer_full_name",
          "name": "Officer"
        },
        {
          "column": "status",
          "name": "Status"
        },
        {
          "column": "assigned_bureau",
          "name": "Assigned Bureau"
        }
      ],
      "group_by_entries": [
        {
          "column": "assigned_bureau",
          "name": "Assigned bureau"
        },
        {
          "column": "agency_name",
          "name": "Agency"
        }
      ],
      "view_entries": [
        {
          "name": "Incidents",
          "column": "occurred_incident_type",
          "aggregate_type": "count",
          "precision": "",
          "prefix": "",
          "suffix": "incidents",
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "showCompareDropDown": "true"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "true"
            }
          },
          "comparison_column_entries": [
            {
              "column": "status",
              "name": "Status",
              "aggregate_type": "",
              "render_type": "stack",
              "precision": "",
              "prefix": "",
              "suffix": ""
            },
            {
              "column": "case_disposition",
              "name": "Case Disposition",
              "aggregate_type": "count",
              "render_type": "bar",
              "precision": "",
              "prefix": "",
              "suffix": "disposition"
            },
            {
              "column": "case_id",
              "name": "Cases",
              "aggregate_type": "count",
              "render_type": "bullet",
              "precision": "",
              "prefix": "",
              "suffix": "cases"
            }
          ],
          "quick_filters": [
            {
              "type": "date",
              "column": "reported_date_time",
              "field": "quick_filter_5_qs3a_3222_0",
              "dateRange": {
                "start_date": "2019-12-01",
                "end_date": "2019-12-30"
              }
            }
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">=",
              "value": "1000",
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
      "filter_by_entries": [
        {
          "column": "status",
          "name": "Status"
        },
        {
          "column": "occurred_incident_type",
          "name": "Incident Type"
        },
        {
          "column": "block",
          "name": "Block"
        },
        {
          "column": "case_arrest_made",
          "name": "Case Arrest Made"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "assigned_bureau",
          "name": "Assigned bureau"
        },
        {
          "column": "agency",
          "name": "Agency"
        },
        {
          "column": "reporting_officer_rank",
          "name": "Officer Rank"
        },
        {
          "column": "reporting_officer_full_name",
          "name": "Officer Name"
        },
        {
          "column": "reported_date_time",
          "name": "Reported Date"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "reported_date_time",
          "name": "Reported Date",
          "renderType": "date"
        }
      ],
      "map": {
        "centerLat": "27.857590",
        "centerLng": "-82.711240",
        "zoom": "12",
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
          "shape_dataset_domain": "pinellasparkpd.data.socrata.com",
          "shape_dataset_id": "hmbv-vp9r",
          "fields": {
            "shape": "multipolygon",
            "shape_id": "_feature_id",
            "shape_name": "zone",
            "shape_description": "zone"
          },
          "color": "#0a4747",
          "shape_name": "Zones"
        },
        {
          "shape_dataset_domain": "pinellasparkpd.data.socrata.com",
          "shape_dataset_id": "xx7z-z9ah",
          "fields": {
            "shape": "polygon",
            "shape_id": "_feature_id",
            "shape_name": "objectid",
            "shape_description": "objectid"
          },
          "color": "#d93909",
          "shape_name": "Us Hwy 19 Buffer"
        }
      ],
      "shape_outline_dataset_entries": [
        {
          "shape_outline_dataset_domain": "pinellasparkpd.data.socrata.com",
          "outline_name": "Districts",
          "shape_outline_dataset_id": "gmha-2akv",
          "fields": {
            "shape": "multipolygon"
          },
          "color": "#d73b70",
          "show_by_default": "true"
        },
        {
          "shape_outline_dataset_domain": "pinellasparkpd.data.socrata.com",
          "outline_name": "Neighborhood12",
          "shape_outline_dataset_id": "2wve-f3n7",
          "fields": {
            "shape": "polygon"
          },
          "color": "#147053",
          "show_by_default": "true"
        },
        {
          "shape_outline_dataset_domain": "pinellasparkpd.data.socrata.com",
          "outline_name": "UsHwy19Buffer",
          "shape_outline_dataset_id": "nhej-vwqe",
          "fields": {
            "shape": "polygon"
          },
          "color": "#750b6e",
          "show_by_default": "false"
        }
      ]
    },
    {
      "name": "Clermont County Property Data",
      "description": "Tax and Appraisals",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "rf3x-u64k",
      "fields": {
        "date_column": "saledt",
        "incident_type": "land_use_type",
        "location": "geocoded_column",
        "5ynq-aczk": ":@computed_region_5ynq_aczk"
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
          "name": "Taxdist"
        },
        {
          "column": "cityname",
          "name": "City"
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
          "name": "Taxdist"
        }
      ],
      "view_entries": [
        {
          "name": "Mean Ratio",
          "column": "estimated_total_market_value/case(price <= 0 or price is null, case(estimated_total_market_value == 0, 1, true, estimated_total_market_value) , true, price)",
          "aggregate_type": "avg",
          "precision": "2",
          "visualization": {
            "default_view": "Map",
            "snapshot": {
              "chart_type": "groupChart"
            }
          },
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "<=",
              "value": "9",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Median Ratio",
          "column": "estimated_total_market_value/case(price <= 0 or price is null, case(estimated_total_market_value == 0, 1, true, mktval) , true, price)",
          "aggregate_type": "median",
          "precision": "2",
          "visualization": {
            "default_view": "Map",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Estimated Total Market Value",
          "column": "estimated_total_market_value",
          "aggregate_type": "sum",
          "precision": "2",
          "prefix": "$",
          "visualization": {
            "default_view": "Map",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        }
      ],
      "filter_by_entries": [
        {
          "column": "tax_year",
          "name": "Tax Year"
        },
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
          "column": "estimated_total_market_value",
          "name": "Estimated Total Market Value"
        },
        {
          "column": "tax_year",
          "name": "Tax Year"
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
          "shape_dataset_id": "5ynq-aczk",
          "shape_name": "Clermont Township Boundaries",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "townname",
            "shape_description": "label"
          },
          "color": "#32a889"
        }
      ]
    },
    {
      "name": "Parcels",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "rf3x-u64k",
      "fields": {
        "date_column": "saledt",
        "incident_type": "land_use_type",
        "location": "geocoded_column",
        "5ynq-aczk": ":@computed_region_5ynq_aczk"
      },
      "parent_queries": [
        "select *,:@computed_region_5ynq_aczk,avg(asr) over (partition by land_use_type='commercial') as median_asr, 1-asr/median_asr as asr_deviation_from_median"
      ],
      "dimension_entries": [
        {
          "column": "style",
          "name": "Syle"
        },
        {
          "column": "grade",
          "name": "Grade"
        }
      ],
      "group_by_entries": [
        {
          "column": "nbhd",
          "name": "Neighbourhood"
        }
      ],
      "view_entries": [
        {
          "name": "Average Absolute Deviation",
          "column": "asr_deviation_from_median",
          "aggregate_type": "avg",
          "precision": "2",
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Coefficient of Dispersion",
          "column": "avg(asr_deviation_from_median)/avg(median_asr)",
          "aggregate_type": "",
          "precision": "2",
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          },
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">",
              "value": "30000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Price Relative Differential",
          "column": "avg(asr)/(   sum(estimated_total_market_value)/sum(price)    )",
          "aggregate_type": "",
          "precision": "2",
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        }
      ],
      "filter_by_entries": [
        {
          "column": "tax_year",
          "name": "Tax Year"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "estimated_market_land_value",
          "name": "Estimated Market Land Value"
        },
        {
          "column": "stories",
          "name": "Stories"
        },
        {
          "column": "basmt",
          "name": "Basement"
        },
        {
          "column": "attic",
          "name": "Attic"
        },
        {
          "column": "extwall",
          "name": "Exterior Wall"
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
          "shape_dataset_id": "5ynq-aczk",
          "shape_name": "Clermont Township Boundaries",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "townname",
            "shape_description": "label"
          },
          "color": "#32a889"
        }
      ]
    },
    {
      "name": "ERP metrics",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "s8xp-hq5q",
      "fields": {
        
      },
      "parent_queries": [
        "select * where service = 'Education'"
      ],
      "dimension_entries": [
        {
          "column": "service",
          "name": "Service"
        }
      ],
      "group_by_entries": [],
      "view_entries": [
        {
          "name": "Funds",
          "column": "entry_type",
          "aggregate_type": "count",
          "visualization": {
            "default_view": "Table"
          },
          "precision": "",
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "==",
              "value": "833",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "quick_filters": [
            {
              "type": "text",
              "column": "program",
              "field": "quick_filter_8_s8xp_hq5q_1",
              "values": [
                "Athletics"
              ],
              "operator": "="
            }
          ]
        }
      ],
      "filter_by_entries": [
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "program",
          "name": "Program"
        },
        {
          "column": "category",
          "name": "Category"
        },
        {
          "column": "department",
          "name": "Department"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "service",
          "name": "Service"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "fund",
          "name": "Fund",
          "renderType": "text"
        },
        {
          "column": "program",
          "name": "Program",
          "renderType": "text"
        },
        {
          "column": "category",
          "name": "Category",
          "renderType": "text"
        },
        {
          "column": "department",
          "name": "Department",
          "renderType": "text"
        }
      ],
      "map": {},
      "shape_datasets": [],
      "shape_outline_dataset_entries": []
    }
  ],
  "template_entries": [
    {
      "name": "Courts and Justice",
      "description": "",
      "dataset_domain": "courtsandjustice.demo.socrata.com",
      "dataset_id": "a333-rfhs",
      "fields": {
        "date_column": "statusdate",
        "incident_type": "casecategorydescription"
      },
      "dimension_entries": [
        {
          "column": "judgeid",
          "name": "Judge ID"
        },
        {
          "column": "casecategorydescription",
          "name": "Case Category"
        },
        {
          "column": "casetypemappingcodedescription",
          "name": "Case Type"
        },
        {
          "column": "nodedescription",
          "name": "Court Name"
        }
      ],
      "group_by_entries": [
        {
          "column": "casetypemappingcodedescription",
          "name": "Case Type"
        },
        {
          "column": "casecategorydescription",
          "name": "Case Category"
        },
        {
          "column": "judgeid",
          "name": "Judge ID"
        },
        {
          "column": "nodedescription",
          "name": "Court Name"
        }
      ],
      "view_entries": [
         {
          "name": "Count of Opened Cases",
          "column": "casenumber",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "parent_queries": [
              "select distinct casenumber, judgeid, casecategorydescription, casetypemappingcodedescription, caseid, nodedescription, max(case(eventstatusmappingcode='CTES_NF' or eventstatusmappingcode='CTES_RO', statusdate)) over (partition by casenumber) as last_opened_date,  max(case(eventstatusmappingcode='CTES_NTD', statusdate)) over (partition by casenumber)  as last_closed_date"
           ],
          "fields": {
            "date_column": "last_opened_date"
          },
          "comparison_column_entries": [
              { 
              "column": "casetypemappingcodedescription",
              "name": "Case Type",
              "aggregate_type": "",
              "render_type": "stack",
              "prefix": "",
              "suffix": "",
              "precision": ""
              }
           ],
          "tags": [
            "Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
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
          "name": "Count of Closed Cases",
          "column": "casenumber",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "cases",
          "parent_queries": [
              "select distinct casenumber, judgeid, casecategorydescription, casetypemappingcodedescription, caseid, nodedescription, max(case(eventstatusmappingcode='CTES_NF' or eventstatusmappingcode='CTES_RO', statusdate)) over (partition by casenumber) as last_opened_date,  max(case(eventstatusmappingcode='CTES_NTD', statusdate)) over (partition by casenumber)  as last_closed_date"
           ],
          "fields": {
            "date_column": "last_closed_date"
          },
          "comparison_column_entries": [
              { 
              "column": "casetypemappingcodedescription",
              "name": "Case Type",
              "aggregate_type": "",
              "render_type": "stack",
              "prefix": "",
              "suffix": "",
              "precision": ""
              }
           ],
          "tags": [
            "Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
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
          "name": "Clearance Rate",
          "column": "(sum(isclosed)/case(sum(isopen) == 0, 1, true, sum(isopen))*100)",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Clearance Rates"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
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
                "chart_type": "groupChart",
                "default_chart_view": "pieChart",
                "show_pie_chart": "true"
            },
            "overtime": {
              "show_area_chart": "true",
              "show_timeline_total": "false"
            }
         },
         "comparison_column_entries": [
              {
              "column": "casenumber",
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
          "column": "judgeid",
          "name": "Judge ID"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "judgeid",
          "name": "Judge ID"
        },
        {
          "column": "casenumber",
          "name": "Case Number"
        },
        {
          "column": "nodedescription",
          "name": "Court Name"
        },
        {
          "column": "casetypemappingcodedescription",
          "name": "Case Type Description"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "casecategorydescription",
          "name": "Case category",
          "renderType": "text"
        }
      ],
      "bench_mark_entries": [
        {
          "view_column": "caseid",
          "dimension_column": "judgeid",
          "display_name": "State Standard",
          "value": "50"
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
      "name": "Time to Disposition",
      "description": "",
      "dataset_domain": "courtsandjustice.demo.socrata.com",
      "dataset_id": "93x4-9x8r",
      "fields": {
        "date_column": "lastcloseddate"
      },
      "dimension_entries": [
        {
          "column": "casetypemappingcodedescription",
          "name": "Case Type"
        },
        {
          "column": "judgeid",
          "name": "Judge ID"
        },
        {
          "column": "nodedescription",
          "name": "Court Name"
        },
        {
          "column": "casenumber",
          "name": "Case Number"
        }
      ],
      "group_by_entries": [
        {
          "column": "casetypemappingcodedescription",
          "name": "Case Type"
        },
        {
          "column": "judgeid",
          "name": "Judge ID"
        },
        {
          "column": "nodedescription",
          "name": "Court Name"
        },
        {
          "column": "casenumber",
          "name": "Case Number"
        }
      ],
      "view_entries": [
         {
          "name": "Mean Time To Disposition",
          "column": "timetodisposition",
          "aggregate_type": "avg",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "days",
          "fields": {
            "date_column": "lastopeneddate"
          },
          "comparison_column_entries": [
              { 
              "column": "casetypemappingcodedescription",
              "name": "Case Type",
              "aggregate_type": "",
              "render_type": "stack",
              "prefix": "",
              "suffix": "",
              "precision": ""
              }
           ],
          "tags": [
            "Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "<",
              "value": "10",
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
          "name": "Median Time To Disposition",
          "column": "timetodisposition",
          "aggregate_type": "median",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "days",
          "fields": {
            "date_column": "lastopeneddate"
          },
          "comparison_column_entries": [
              { 
              "column": "casetypemappingcodedescription",
              "name": "Case Type",
              "aggregate_type": "",
              "render_type": "stack",
              "prefix": "",
              "suffix": "",
              "precision": ""
              }
           ],
          "tags": [
            "Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "<",
              "value": "10",
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
          "name": "Percentage of Cases With Time To Disposition < 180 Days",
          "column": "sum(timetodisposition_flag)/count(*)*100",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "1",
          "prefix": "",
          "suffix": "%",
          "parent_queries": [
              "select  *, case(timetodisposition < 180, 1) as timetodisposition_flag"
           ],
          "fields": {
            "date_column": "lastopeneddate"
          },
          "comparison_column_entries": [
              { 
              "column": "casetypemappingcodedescription",
              "name": "Case Type",
              "aggregate_type": "",
              "render_type": "stack",
              "prefix": "",
              "suffix": "",
              "precision": ""
              }
           ],
          "tags": [
            "Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "<",
              "value": "10",
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
          "name": "Percentage of Cases With Time To Disposition < 365 Days",
          "column": "sum(timetodisposition_flag)/count(*)*100",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "1",
          "prefix": "",
          "suffix": "%",
          "parent_queries": [
              "select  *, case(timetodisposition < 365, 1) as timetodisposition_flag"
           ],
          "fields": {
            "date_column": "lastopeneddate"
          },
          "comparison_column_entries": [
              { 
              "column": "casetypemappingcodedescription",
              "name": "Case Type",
              "aggregate_type": "",
              "render_type": "stack",
              "prefix": "",
              "suffix": "",
              "precision": ""
              }
           ],
          "tags": [
            "Cases"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "<",
              "value": "10",
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
       }            
      ],
      "filter_by_entries": [
        {
          "column": "judgeid",
          "name": "Judge ID"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "judgeid",
          "name": "Judge ID"
        },
        {
          "column": "casenumber",
          "name": "Case Number"
        },
        {
          "column": "nodedescription",
          "name": "Court Name"
        },
        {
          "column": "casetypemappingcodedescription",
          "name": "Case Type Description"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "casetypemappingcodedescription",
          "name": "Case category",
          "renderType": "text"
        }
      ],
      "bench_mark_entries": [
        {
          "view_column": "caseid",
          "dimension_column": "judgeid",
          "display_name": "State Standard",
          "value": "50"
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
      "name": "Court Operations",
      "dataset_domain": "courtsandjustice.demo.socrata.com",
      "dataset_id": "6nic-t5bv",
      "default_view": "Snapshot",
      "fields": {
        "date_column": "hearing_date"
      },
      "dimension_entries": [
        {
          "column": "last_casetypedescription",
          "name": "Case Type Description"
        },
        {
          "column": "last_casecategorydescription",
          "name": "Case Category Description"
        },
        {
          "column": "casenumber",
          "name": "Case Number"
        }         
      ],
      "view_entries": [
        {
          "name": "Trial Date Certainty",
          "column": "sum(certainty_count)/count(*)*100",
          "parent_queries": [
            "select count(hearingdate) as total_hearing_dates,casenumber,max(hearingdate) as hearing_date,min(hearingdate) as first_hearing,max(hearingdate) as last_hearing, min(casetypedescription) as last_casetypedescription, min(casecategorydescription) as last_casecategorydescription, min(casecategorymappingdescription) as last_casecategorymappingdescription group by casenumber |> select hearing_date,total_hearing_dates,casenumber,first_hearing,last_hearing, last_casetypedescription, last_casecategorydescription, last_casecategorymappingdescription, case(total_hearing_dates < 3, 1, total_hearing_dates >= 3, 0) as certainty_count"
          ],
          "aggregate_type": "",
          "precision": "1",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Cases"
          ],
       "visualization": {
          "default_view": "Snapshot",
            "snapshot": {
                "chart_type": "barChart"
            }
          }
        }, 
        {
          "name": "Count of Hearings",
          "column": "hearingid",
          "parent_queries": [
            "select distinct hearingid, casenumber, casecategorydescription as last_casecategorydescription, casetypedescription as last_casetypedescription,  max(hearingdate) over (partition by hearingid) as last_hearing_date"
          ],
          "fields": {
            "date_column": "last_hearing_date"
          },
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "hearings",
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
          "column": "last_casetypedescription",
          "name": "Case Type Description"
        },
        {
          "column": "last_casecategorydescription",
          "name": "Case Category Description"
        },
        {
          "column": "casenumber",
          "name": "Case Number"
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
