{
  "branding": {},
  "tag_list": [
    "Cases",
    "Judges",
    "Clearence rates",
    "Districts and counties"
  ],
  "show_share_via_email": "false",
  "is_private": "false",
  "template_entries": [
    {
      "name": "Opex Budget",
      "dataset_domain": "evergreen.data.socrata.com",
      "dataset_id": "s8xp-hq5q",
      "default_view": "Snapshot"
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
          "stack_column": "entry_type",
          "tags": ["Cases", "Clearence rates"]
        },
        {
          "name": "Total amount spent",
          "column": "actual_amount",
          "aggregate_type": "sum",
          "stack_column": "entry_type",
          "prefix": "$",
          "precision": "2",
          "name_1": "Total amount approved",
          "column": "approved_amount",
          "aggregate_type_1": "sum",
          "quick_filters": [
          {
            "column": "program",
            "type": "text",
            "field": "quick_filter_0_s8xp_hq5q_2",
            "values": ["a"],
            "operator": "like"
            }
          ]
        },
        {
          "name": "Amount spent on Salary And Wages",
          "column": "actual_amount",
          "aggregate_type": "sum",
          "stack_column": "entry_type",
          "prefix": "$",
          "precision": "2",
          "quick_filters": [
            { 
              "column": "category", 
              "type": "text", 
              "field": "quick_filter_0_s8xp_hq5q_4", 
              "values": ["Salary and Wages"], 
              "operator": "="
            }
          ]
        },
        {
          "name": "Total amount approved",
          "column": "approved_amount",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
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
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2"
        },
        {
          "name": "Total Projections",
          "column": "projected_amount",
          "aggregate_type": "sum",
          "prefix": "$",
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
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2"
        },
        {
          "column": "actual_amount",
          "name": "Actual Amount",
          "aggregate_type": "sum",
          "prefix": "$",
          "precision": "2"
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
          "aggregate_type": "sum",
          "prefix": "$",
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
      "name": "Cobb-Dekalb-Fulton",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "3hre-b49k",
      "default_view": "Map",
      "visualization": {
        "snapshot": {
          "chart_type": "groupChart"
        }
      },
      "fields": {
        "date_column": "sale_date",
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
          "use_dimension_value": "true",
          "precision": "2"
        },
        {
          "name": "Sales",
          "column": "sale_type",
          "aggregate_type": "count",
          "stacked_column": "sale_type",
          "precision": "2"
        },
        {
          "name": "Building value",
          "column": "building_value",
          "aggregate_type": "sum",
          "use_dimension_value": "true",
          "precision": "2",
          "prefix": "$"
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
      "default_view": "Snapshot",
      "visualization": {
        "snapshot": {
          "chart_type": "groupChart"
        }
      },
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
          "use_dimension_value": "true",
          "precision": "2",
          "quick_filters": [
          {
            "type": "date",
            "column": "reported_date_time",
            "field": "quick_filter_5_qs3a_3222_0",
            "dateRange": {"start_date": "2019-12-01", "end_date": "2019-12-30"}
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
      "default_view": "Map",
      "visualization": {
        "snapshot": {
          "chart_type": "groupChart"
        }
      },
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
          "use_dimension_value": "true",
          "precision": "2"
        },
        {
          "name": "Median Ratio",
          "column": "estimated_total_market_value/case(price <= 0 or price is null, case(estimated_total_market_value == 0, 1, true, market_total) , true, price)",
          "aggregate_type": "median",
          "use_dimension_value": "true",
          "precision": "2"
        },
        {
          "name": "Estimated Total Market Value",
          "column": "estimated_total_market_value",
          "aggregate_type": "sum",
          "stack_column": "land_use_type",
          "precision": "2",
          "prefix": "$"
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
      "default_view": "Snapshot",
      "visualization": {
        "snapshot": {
          "chart_type": "groupChart"
        }
      },
      "fields": {
        "date_column": "saledt",
        "incident_type": "land_use_type",
        "location": "geocoded_column",
        "73f8-h8ah": ":@computed_region_73f8_h8ah"
      },
      "parent_queries": [
        "select *,avg(asr) over (partition by land_use_type='commercial') as median_asr, 1-asr/median_asr as asr_deviation_from_median"
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
          "use_dimension_value": "true",
          "precision": "2"
        },
        {
          "name": "Coefficient of Dispersion",
          "column": "avg(asr_deviation_from_median)/avg(median_asr)",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "2"
        },
        {
          "name": "Price Relative Differential",
          "column": "avg(asr)/(   sum(estimated_total_market_value)/sum(price)    )",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "2"
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
      "default_view": "Snapshot",
      "fields": {
        "date_column": "fiscal_year"
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
      "group_by_entries": [
        
      ],
      "view_entries": [
        {
          "name": "Funds",
          "column": "entry_type",
          "aggregate_type": "count",
          "stack_column": "entry_type",
          "precision": "2"
        }
      ],
      "filter_by_entries": [
        {
          "column": "fund",
          "name": "Fund"
        }
      ],
      "leaf_page_entries": [
        {
          "column": "service",
          "name": "Service"
        }
      ],
      "quick_filter_entries": [
        
      ],
      "map": {
        
      },
      "shape_datasets": [
        
      ],
      "shape_outline_dataset_entries": [
        
      ]
    }
  ]
}
