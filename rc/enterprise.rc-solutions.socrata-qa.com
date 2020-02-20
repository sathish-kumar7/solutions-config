{
  "branding": {
    "delimiter": ",",
    "browser_title": "Munis Executive Insights",
    "title": "Solutions - ERP Financials"
  },
  "date_options": {
    "type": "yearly",
    "default_year": "2020",
    "year_start_month": "7"
  },
  "tag_list": [
    "Financials",
    "Budget & Expenditures",
    "Payroll & HR",
    "Revenue & Tax",
    "Permitting",
    "Sales"
  ],
  "show_share_via_email": true,
  "is_private": "false",
  "template_entries": [
    {
      "name": "Core Financials",
      "dataset_domain": "erpinsights.demo.socrata.com",
      "dataset_id": "darw-mart",
      "fields": {
        "date_column": "fiscalmonth"
      },
      "dimension_entries": [
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
      "view_entries": [
        {
          "name": "Cash Balance",
          "parent_queries": [
            "select * where cashaccount = 'true'"
          ],
          "column": "actual",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Financials"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">",
              "value": "135000000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "quick_filters": [],
          "visualization": {
            "default_view": "overtime",
            "overtime": {
              "show_area_chart": "false",
              "show_burn_up_chart": "true",
              "default_view": "burn_up"
            }
          },
          "start_date_override_and_ignore": "true"
        },
        {
          "name": "General Fund Cash Balance",
          "parent_queries": [
            "select * where cashaccount = 'true' and fund = 'GENERAL FUND'"
          ],
          "column": "actual",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Financials"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">",
              "value": "0",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "quick_filters": [],
          "visualization": {
            "default_view": "overtime",
            "overtime": {
              "show_area_chart": "false",
              "show_burn_up_chart": "true",
              "default_view": "burn_up"
            }
          },
          "start_date_override_and_ignore": "true"
        },
        {
          "name": "Unadjusted Net Income",
          "parent_queries": [
            "select *, case(accounttype == 'Revenue', actual, true, 0) as revenue_amount, case(accounttype == 'Expense', actual, true, 0) as expenditures_amount"
          ],
          "column": "sum(revenue_amount) - sum(expenditures_amount)",
          "aggregate_type": "",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Financials"
          ],
          "target_entries": [],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "revenue_amount",
                    "name": "Revenue Amount",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  },
                  {
                    "column": "expenditures_amount",
                    "name": "Expenditure Amount",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  }
                ]
              }
            },
            "overtime": {
              "show_area_chart": "false",
              "show_burn_up_chart": "true",
              "timeline": {
                "secondary_metric_entries": [
                  {
                    "column": "revenue_amount",
                    "name": "Revenue Amount",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "expenditures_amount",
                    "name": "Expenditure Amount",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  }
                ]
              }
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
      "quick_filter_entries": [
        {
          "column": "accounttype",
          "name": "Account Type",
          "renderType": "text"
        }
      ]
    },
    {
      "name": "Budget Expenses",
      "dataset_domain": "murfreesboro.data.socrata.com",
      "dataset_id": "tdpw-ufv6",
      "fields": {
        "date_column": "fiscalmonth"
      },
      "dimension_entries": [
        {
          "column": "segment2",
          "name": "Major Function"
        },
        {
          "column": "segment3",
          "name": "Department"
        },
        {
          "column": "charactercodedescription",
          "name": "Character Code"
        },
        {
          "column": "object",
          "name": "Budget Object"
        },
        {
          "column": "organization",
          "name": "Organization"
        },
        {
          "column": "fund",
          "name": "Fund"
        }
      ],
      "view_entries": [
        {
          "name": "Actuals vs. Budget",
          "primary_metric_name": "Actuals",
          "column": "actual",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Budget & Expenditures"
          ],
          "visualization": {
            "default_view": "overtime",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "false",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  },
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  }
                ],
                "default_secondary_metric": "Revised Budget"
              }
            },
            "overtime": {
              "default_view": "burn_up",
              "show_area_chart": "true",
              "show_burn_up_chart": "true",
              "show_timeline_total": "true",
              "timeline": {
                "default_bench_mark": "Revised Budget",
                "default_time_frame": "year_on_year",
                "default_compare_year": "2019",
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum"
                  }
                ]
              },
              "burn_up": {
                "default_bench_mark": "Revised Budget",
                "default_time_frame": "year_on_year",
                "default_compare_year": "2019",
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum"
                  }
                ]
              }
            }
          },
          "parent_queries": [
            "select * where entity = 'City'"
          ]
        },
        {
          "name": "Water Resources Actuals vs. Budget",
          "column": "actual",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Budget & Expenditures",
            "Water Resources"
          ],
          "visualization": {
            "default_view": "overtime",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "false",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  },
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  }
                ],
                "default_secondary_metric": "Revised Budget"
              }
            },
            "overtime": {
              "default_view": "burn_up",
              "show_area_chart": "true",
              "show_burn_up_chart": "true",
              "show_timeline_total": "true",
              "timeline": {
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum"
                  }
                ]
              },
              "burn_up": {
                "default_bench_mark": "Revised Budget",
                "default_time_frame": "year_on_year",
                "default_compare_year": "2019",
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum"
                  }
                ]
              }
            }
          },
          "parent_queries": [
            "select * where entity = 'Water Resources'"
          ]
        },
        {
          "name": "Payroll Expenses vs. Budget",
          "column": "actual",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Budget & Expenditures"
          ],
          "visualization": {
            "default_view": "overtime",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "false",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  },
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  }
                ],
                "default_secondary_metric": "Revised Budget"
              },
              "default_comparison_column_entry": "revisedbudget"
            },
            "overtime": {
              "default_view": "burn_up",
              "show_area_chart": "true",
              "show_burn_up_chart": "true",
              "show_timeline_total": "true",
              "timeline": {
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum"
                  }
                ]
              },
              "burn_up": {
                "default_bench_mark": "Revised Budget",
                "default_time_frame": "year_on_year",
                "default_compare_year": "2019",
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum"
                  }
                ]
              }
            }
          },
          "parent_queries": [
            "select * where segment6 = 'Salary&Benefit Expenditures' and entity = 'City'"
          ]
        },
        {
          "name": "Water Resources Payroll Expenses vs. Budget",
          "column": "actual",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Budget & Expenditures",
            "Water Resources"
          ],
          "visualization": {
            "default_view": "overtime",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "false",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  },
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  }
                ],
                "default_secondary_metric": "Revised Budget"
              },
              "default_comparison_column_entry": "revisedbudget"
            },
            "overtime": {
              "default_view": "burn_up",
              "show_area_chart": "true",
              "show_burn_up_chart": "true",
              "show_timeline_total": "true",
              "timeline": {
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum"
                  }
                ]
              },
              "burn_up": {
                "default_bench_mark": "Revised Budget",
                "default_time_frame": "year_on_year",
                "default_compare_year": "2019",
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum"
                  }
                ]
              }
            }
          },
          "parent_queries": [
            "select * where segment6 = 'Salary&Benefit Expenditures' and entity = 'Water Resources'"
          ]
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
          "column": "segment2",
          "name": "Major Function"
        },
        {
          "column": "segment3",
          "name": "Department"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "accounttype",
          "name": "Account Type",
          "renderType": "text"
        }
      ]
    },
    {
      "name": "Budgeted Revenues",
      "dataset_domain": "murfreesboro.data.socrata.com",
      "dataset_id": "wiba-zbm5",
      "fields": {
        "date_column": "fiscalmonth"
      },
      "dimension_entries": [
        {
          "column": "entity",
          "name": "Entity"
        },
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "segment2",
          "name": "Major Function"
        },
        {
          "column": "segment3",
          "name": "Department"
        },
        {
          "column": "charactercodedescription",
          "name": "Character Code"
        },
        {
          "column": "object",
          "name": "Budget Object"
        },
        {
          "column": "organization",
          "name": "Organization"
        },
        {
          "column": "accounttype",
          "name": "Account type"
        }
      ],
      "view_entries": [
        {
          "name": "Revenue vs. Budget",
          "column": "actual",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Revenue & Tax"
          ],
          "visualization": {
            "default_view": "overtime",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "false",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  },
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  }
                ],
                "default_secondary_metric": "Revised Budget"
              }
            },
            "overtime": {
              "default_view": "burn_up",
              "show_area_chart": "true",
              "show_burn_up_chart": "true",
              "show_timeline_total": "true",
              "timeline": {
                "default_bench_mark": "Revised Budget",
                "default_time_frame": "year_on_year",
                "default_compare_year": "2019",
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum"
                  }
                ]
              },
              "burn_up": {
                "default_bench_mark": "Revised Budget",
                "default_time_frame": "year_on_year",
                "default_compare_year": "2019",
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum"
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Tax Revenue vs. Budget",
          "column": "actual",
          "parent_queries": [
            "select * where charactercodedescription = 'Local Taxes'"
          ],
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Revenue & Tax"
          ],
          "visualization": {
            "default_view": "overtime",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "false",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  },
                  {
                    "column": "actual",
                    "name": "Actual Revenue",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2",
                    "render_type": "bullet"
                  }
                ],
                "default_secondary_metric": "Revised Budget"
              }
            },
            "overtime": {
              "default_view": "burn_up",
              "show_area_chart": "true",
              "show_burn_up_chart": "true",
              "show_timeline_total": "true",
              "timeline": {
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "actual",
                    "name": "Actual Revenue",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  }
                ]
              },
              "burn_up": {
                "default_bench_mark": "Revised Budget",
                "default_time_frame": "year_on_year",
                "default_compare_year": "2019",
                "secondary_metric_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "actual",
                    "name": "Actual Revenue",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "column": "revisedbudget",
                    "name": "Revised Budget",
                    "aggregate_type": "sum"
                  },
                  {
                    "column": "originalbudget",
                    "name": "Original Budget",
                    "aggregate_type": "sum"
                  }
                ]
              }
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
          "column": "segment2",
          "name": "Major Function"
        },
        {
          "column": "segment3",
          "name": "Department"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "accounttype",
          "name": "Account Type",
          "renderType": "text"
        }
      ]
    },
    {
      "name": "Payroll & Compensation",
      "dataset_domain": "erpinsights.demo.socrata.com",
      "dataset_id": "dfmt-x4an",
      "fields": {
        "date_column": "checkdate"
      },
      "dimension_entries": [
        {
          "column": "groupbargainingunit",
          "name": "Bargaining Unit"
        },
        {
          "column": "jobclass",
          "name": "Job"
        },
        {
          "column": "position",
          "name": "Position"
        },
        {
          "column": "employeeid",
          "name": "Employee ID"
        },
        {
          "column": "paycategory",
          "name": "Pay Category"
        },
        {
          "column": "paytype",
          "name": "Pay Type"
        }
      ],
      "view_entries": [
        {
          "name": "Total Payroll",
          "column": "payamount",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "0",
          "tags": [
            "Payroll & HR"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "false",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "paycategory",
                    "name": "Pay Type",
                    "aggregate_type": "",
                    "prefix": "",
                    "suffix": "",
                    "precision": "",
                    "render_type": "stack"
                  }
                ],
                "default_secondary_metric": "Pay Type"
              }
            },
            "overtime": {
              "show_burn_up_chart": "true",
              "timeline": {
                "bench_mark_entries": [
                  {
                    "column": "payamount",
                    "name": "Total payroll",
                    "aggregate_type": "sum"
                  }
                ]
              },
              "burn_up": {
                "bench_mark_entries": [
                  {
                    "column": "payamount",
                    "name": "Total payroll",
                    "aggregate_type": "sum"
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Total Overtime",
          "column": "payamount",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Payroll & HR"
          ],
          "visualization": {
            "default_view": "snapshot"
          },
          "quick_filters": [
            {
              "column": "paycategory",
              "field": "quick_filter_1_dfmt_x4an_0",
              "type": "text",
              "values": [
                "OVERTIME"
              ],
              "operator": "="
            }
          ]
        },
        {
          "name": "Headcount",
          "parent_queries": [
            "select employeeid, min(checkdate) as first_checkdate, max(checkdate) as last_checkdate, max(location) as last_location, max(position) as last_position, max(jobclass) as jobclass, max(groupbargainingunit) as groupbargainingunit, max(paycategory) as paycategory, max(paytype) as paytype group by employeeid"
          ],
          "fields": {
            "date_column": "first_checkdate",
            "date_column_secondary": "last_checkdate"
          },
          "column": "employeeid",
          "aggregate_type": "count",
          "prefix": "",
          "suffix": "employees",
          "precision": "",
          "tags": [
            "Payroll & HR"
          ],
          "visualization": {
            "default_view": "snapshot"
          },
          "quick_filters": []
        }
      ],
      "leaf_page_entries": [
        {
          "column": "position",
          "name": "Position"
        },
        {
          "column": "jobclass",
          "name": "Job Class"
        },
        {
          "column": "paycategory",
          "name": "Pay Type"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "paycategory",
          "name": "Pay Type",
          "renderType": "text"
        }
      ]
    },
    {
      "name": "Employee Actions",
      "dataset_domain": "erpinsights.demo.socrata.com",
      "dataset_id": "57n2-v5cf",
      "fields": {
        "date_column": "effectivedate"
      },
      "dimension_entries": [
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "jobclass",
          "name": "Job Class"
        },
        {
          "column": "position",
          "name": "Position"
        },
        {
          "column": "action",
          "name": "Action"
        },
        {
          "column": "reason",
          "name": "Reason"
        }
      ],
      "view_entries": [
        {
          "name": "Internal Transfers",
          "column": "case(isdepartmentchanged = 'True', 1, true, 0)",
          "aggregate_type": "sum",
          "prefix": "",
          "suffix": "",
          "precision": "",
          "tags": [
            "Payroll & HR"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart"
            }
          },
          "comparison_column_entries": []
        },
        {
          "name": "Retirements & Resignations",
          "column": "actionhistoryid",
          "aggregate_type": "count",
          "prefix": "",
          "suffix": "",
          "precision": "",
          "tags": [
            "Payroll & HR"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart"
            }
          },
          "comparison_column_entries": [],
          "parent_queries": [
            "select * where action like '%RESIGN%'"
          ]
        }
      ],
      "leaf_page_entries": [
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "jobclass",
          "name": "Job Class"
        },
        {
          "column": "position",
          "name": "Position"
        },
        {
          "column": "action",
          "name": "Action"
        },
        {
          "column": "reason",
          "name": "Reason"
        },
        {
          "column": "employeename",
          "name": "Employee"
        }
      ]
    },
    {
      "name": "Bids",
      "dataset_domain": "erpinsights.demo.socrata.com",
      "dataset_id": "4f5p-ynjv",
      "fields": {
        "date_column": "datesubmitted"
      },
      "dimension_entries": [
        {
          "column": "opportunityname",
          "name": "Oppurtunity Name"
        },
        {
          "column": "biddername",
          "name": "Bidder Name"
        },
        {
          "column": "requestingdepartment",
          "name": "Requesting Department"
        },
        {
          "column": "iswomenorminoritybusines",
          "name": "Is WBE"
        }
      ],
      "view_entries": [
        {
          "name": "MBE|WBE Bid %",
          "column": "sum(case(iswomenorminoritybusines='True', 1, true, 0)) / count(bidderid)*100",
          "aggregate_type": "",
          "prefix": "",
          "suffix": "%",
          "precision": "2",
          "tags": [
            "Budget & Expenditures"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart"
            }
          },
          "comparison_column_entries": []
        }
      ],
      "leaf_page_entries": [
        {
          "column": "opportunityname",
          "name": "Oppurtunity Name"
        },
        {
          "column": "biddername",
          "name": "Bidder Name"
        },
        {
          "column": "requestingdepartment",
          "name": "Requesting Department"
        }
      ]
    },
    {
      "name": "Bids per Opportunity",
      "dataset_domain": "erpinsights.demo.socrata.com",
      "dataset_id": "4f5p-ynjv",
      "parent_queries": [
        "select min(opportunityname) as oppurtunity_name, min(datesubmitted) as date_submitted, min(biddername) as bidder_name, min(requestingdepartment) as requesting_department, count(bidderid) as bidder_count, opportunityid group by opportunityid "
      ],
      "fields": {
        "date_column": "date_submitted"
      },
      "dimension_entries": [
        {
          "column": "oppurtunity_name",
          "name": "Oppurtunity Name"
        },
        {
          "column": "bidder_name",
          "name": "Bidder Name"
        },
        {
          "column": "requesting_department",
          "name": "Requesting Department"
        }
      ],
      "view_entries": [
        {
          "name": "Bids per Opportunity",
          "column": "sum(bidder_count)/count(opportunityid)",
          "aggregate_type": "",
          "prefix": "",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Budget & Expenditures"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart"
            }
          },
          "comparison_column_entries": []
        }
      ],
      "leaf_page_entries": [
        {
          "column": "oppurtunity_name",
          "name": "Oppurtunity Name"
        },
        {
          "column": "bidder_name",
          "name": "Bidder Name"
        },
        {
          "column": "requesting_department",
          "name": "Requesting Department"
        }
      ]
    },
    {
      "name": "Applicants per Open Position",
      "dataset_domain": "erpinsights.demo.socrata.com",
      "dataset_id": "n5zv-gf3k",
      "parent_queries": [
        "select min(jobopening) as job_opening, min(city) as city, count(applicantid) as applicant_id, jobopeningrequisitionnumber where applicationdate between {START_DATE} and {END_DATE} group by jobopeningrequisitionnumber"
      ],
      "fields": {
        "date_column": "hire_date"
      },
      "dimension_entries": [
        {
          "column": "job_opening",
          "name": "Job Opening"
        },
        {
          "column": "city",
          "name": "City"
        }
      ],
      "view_entries": [
        {
          "name": "Applicants per Open Position",
          "column": "applicant_id",
          "aggregate_type": "avg",
          "prefix": "",
          "suffix": "applicants",
          "precision": "0",
          "tags": [
            "Payroll & HR"
          ],
          "start_date_override_and_ignore": "true",
          "end_date_override_and_ignore": "true",
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart"
            }
          },
          "comparison_column_entries": []
        }
      ],
      "leaf_page_entries": [
        {
          "column": "job_opening",
          "name": "Job Opening"
        },
        {
          "column": "city",
          "name": "City"
        }
      ]
    },
    {
      "name": "Time to Hire",
      "dataset_domain": "erpinsights.demo.socrata.com",
      "dataset_id": "n5zv-gf3k",
      "fields": {
        "date_column": "hiredate"
      },
      "dimension_entries": [
        {
          "column": "jobopening",
          "name": "Job Opening"
        },
        {
          "column": "city",
          "name": "City"
        }
      ],
      "view_entries": [
        {
          "name": "Time to Hire",
          "column": "date_diff_d(hiredate, positionopendate)",
          "aggregate_type": "avg",
          "prefix": "",
          "suffix": "days",
          "precision": "0",
          "tags": [
            "Payroll & HR"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart"
            }
          },
          "comparison_column_entries": []
        }
      ],
      "leaf_page_entries": [
        {
          "column": "job_opening",
          "name": "Job Opening"
        },
        {
          "column": "city",
          "name": "City"
        }
      ]
    },
    {
      "name": "Permitting",
      "dataset_domain": "tyler.partner.socrata.com",
      "dataset_id": "amhj-22i6",
      "fields": {
        "date_column": "applicationdate",
        "incident_type": "permittypegroup",
        "location": "location",
        "8t69-jvh8": ":@computed_region_8t69_jvh8"
      },
      "dimension_entries": [
        {
          "column": "permittypegroup",
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
      "view_entries": [
        {
          "name": "Permits Issued",
          "column": "permitid",
          "aggregate_type": "count",
          "prefix": "",
          "suffix": "permits",
          "precision": "0",
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          },
          "use_dimension_value": "true",
          "fields": {
            "date_column": "issueddate"
          }
        },
        {
          "name": "Total Applications Received",
          "column": "permitid",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "overtime",
            "snapshot": {
              "chart_type": "groupChart"
            }
          },
          "fields": {
            "date_column": "applicationdate"
          }
        },
        {
          "name": "Permits issued Within 90 days",
          "column": "((sum(less_than_90_count)/count(*))::double)*100.00",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "permitnumber",
                    "name": "Number of Permits",
                    "aggregate_type": "count",
                    "prefix": "",
                    "suffix": "",
                    "precision": "0",
                    "render_type": "bullet"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "name": "90%",
                    "value": "90"
                  }
                ]
              },
              "scatterplot": {
                "default_show_range": "false",
                "secondary_metric_entries": [
                  {
                    "column": "permitnumber",
                    "name": "Number of Permits",
                    "aggregate_type": "count",
                    "precision": "",
                    "prefix": "",
                    "suffix": ""
                  }
                ]
              }
            }
          },
          "fields": {
            "date_column": "applicationdate"
          },
          "parent_queries": [
            "select :@computed_region_8t69_jvh8, location, applicationdate, permitnumber, permittypegroup, permitstatus, permitworkclass, capital_fund_project,projectname, district, applied_to_issued, case(applied_to_issued < 90, 1) as less_than_90_count where isstatusissued='true'"
          ],
          "target_entries": [
            {
              "name": "SLA Met",
              "color": "#259652",
              "operator": ">",
              "value": "90",
              "icon": "icons-check-circle"
            },
            {
              "name": "SLA Not Met",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Average # Days from Application to Issuance",
          "column": "avg(applied_to_issued)",
          "aggregate_type": "",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": " days",
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          },
          "target_entries": [
            {
              "name": "SLA Met",
              "color": "#259652",
              "operator": "<",
              "value": "120",
              "icon": "icons-check-circle"
            },
            {
              "name": "SLA Not Met",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Total Estimated Value of Permitted Construction",
          "column": "sum(permitvaluation)",
          "aggregate_type": "",
          "use_dimension_value": "",
          "precision": "0",
          "prefix": "$",
          "suffix": "",
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
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
          "column": "permittypegroup",
          "name": "Permit Type"
        },
        {
          "column": "district",
          "name": "District"
        }
      ],
      "description": "Permitting",
      "group_by_entries": [
        {
          "column": "permittypegroup",
          "name": "Permit Type"
        },
        {
          "column": "district",
          "name": "District"
        },
        {
          "column": "projectname",
          "name": "Project"
        }
      ],
      "map": {
        "centerLat": "43.539349",
        "centerLng": "-96.730926",
        "zoom": "10",
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
      "shape_dataset_entries": [
        {
          "shape_dataset_domain": "tyler.partner.socrata.com",
          "shape_dataset_id": "8t69-jvh8",
          "shape_name": "City Council Districts",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "repname",
            "shape_description": "repname"
          },
          "color": "#32a889"
        }
      ]
    },
        {
      "name": "Cobb County Property Data",
      "description": "Tax and Appraisals",
      "dataset_domain": "appraisalandtax.demo.socrata.com",
      "dataset_id": "n3pu-983n",
      "parent_queries": [
        "select *,:@computed_region_52nt_trix where sale_validity in ('0','00')",
        "select *,:@computed_region_52nt_trix,avg(asr) over (partition by land_use_type) as median_asr, 1-asr/median_asr as asr_deviation_from_median"
      ],
      "fields": {
        "date_column": "saledt",
        "incident_type": "land_use_type",
        "location": "geocoded_column",
        "sua5-m9tm": "sua5_m9tm_objectid",
        "52nt-trix": ":@computed_region_52nt_trix"
      },
      "dimension_entries": [
        {
          "column": "class_cleaned_",
          "name": "Class"
        },{
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
          "column": "sale_appr_value/case(price <= 0 or price is null, case(sale_appr_value == 0, 1, true, sale_appr_value) , true, price)",
          "aggregate_type": "avg",
          "precision": "2",
          "prefix": "",
          "suffix": "",
          "use_dimension_value": "true",
          "tags": [
            "Sales"
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
                    "column": "parid",
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
                    "name": "20% Variance",
                    "value": "1.2",
                    "value1": "0.8"
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
            "default_view": "snapshot",
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
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            }
          }
        },
        {
          "name": "Price Relative Differential",
          "column": "avg(asr)/(   sum(sale_appr_value)/sum(price)    )",
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
          "name": "Median Ratio",
          "column": "sale_appr_value/case(price <= 0 or price is null, case(sale_appr_value == 0, 1, true, sale_appr_value) , true, price)",
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
        },
        {
          "name": "Estimated Total Market Value",
          "column": "appr_total",
          "aggregate_type": "sum",
          "stack_column": "land_use_type",
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
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart",
              "show_pie_chart": "true"
            }
          }
        },{
          "name": "% Parcels Sold",
          "column": "(sum(has_sold)/258000)::double*100",
          "aggregate_type": "",
          "stack_column": "land_use_type",
          "precision": "0",
          "prefix": "",
          "suffix": "%",
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
            "select *, case(saledt is not null,1,true,0) as has_sold"
          ]
        },
        {
          "name": "% Appealed Value Upheld",
          "column": "(sum(decision_value) / sum(appr_total))*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Appeals"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "true"
            }
          },
          "parent_queries": [
            "select * where appealed='true'"
          ]
        },
        {
          "name": "% Appealed",
          "column": "(sum(was_appealed) / count(*))::double*100",
          "aggregate_type": "",
          "precision": "2",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Appeals"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "true"
            }
          },
          "parent_queries": [
            "select *, case(appealed='true',1,true,0) as was_appealed"
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
          "column": "sale_appr_value/case(price <= 0 or price is null, case(sale_appr_value == 0, 1, true, sale_appr_value) , true, price)"
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
