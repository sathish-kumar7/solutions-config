{
  "branding": {
    "delimiter": ",",
    "browser_title": "Portland Executive Insights",
    "title": "Portland Executive Insights"
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
    "Schools",
    "Assessor",
    "Permitting"
  ],
  "show_share_via_email": true,
  "is_private": "false",
  "template_entries": [
    {
      "name": "Core Financials",
      "dataset_domain": "portlandme.data.socrata.com",
      "dataset_id": "b5z7-aw6y",
      "fields": {
        "date_column": "fiscalmonth"
      },
      "dimension_entries": [
        {
          "column": "segment2",
          "name": "Function"
        },
        {
          "column": "segment3",
          "name": "Department"
        },
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "segment4",
          "name": "Division"
        },
        {
          "column": "organization",
          "name": "Organisation"
        },
        {
          "column": "object",
          "name": "Budget Object"
        },
        {
          "column": "charactercodedescription",
          "name": "Character Code"
        },
        {
          "column": "accountdescription",
          "name": "Account Description"
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
              "icon": "icons-check-circle",
              "target_entry_description": "Cash balance is currently on target against an FY20 plan of $135 million."
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
            "select * where cashaccount = 'true' and fund = 'General Fund'"
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
        },
        {
          "name": "Actuals vs. Budget",
          "primary_metric_name": "Actuals",
          "column": "actual",
          "parent_queries": [
            "select * where accounttype = 'Expense'"
          ],
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
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">",
              "value": "1000",
              "icon": "icons-check-circle",
              "target_entry_description": "Spending is currently on track to remain within budgeted levels ($332 million for FY20)."
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "City Actuals vs. Budget",
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
            "select * where entity = 'City' and accounttype = 'Expense'"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">",
              "value": "1000",
              "icon": "icons-check-circle",
              "target_entry_description": "Spending is currently on track to remain within budgeted levels ($332 million for FY20)."
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Schools Actuals vs. Budget",
          "column": "actual",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Budget & Expenditures",
            "Schools"
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
            "select * where entity = 'School' and accounttype = 'Expense'"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "<",
              "value": "1000",
              "icon": "icons-check-circle"
            }
          ]
        },
        {
          "name": "Jetport Actuals vs. Budget",
          "column": "actual",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Budget & Expenditures",
            "Schools"
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
            "select * where segment3 = 'Jetport' and accounttype = 'Expense'"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "<",
              "value": "1000",
              "icon": "icons-check-circle"
            }
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
            "Budget & Expenditures",
            "Payroll & HR"
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
            "select * where charactercodedescription = 'Payroll'"
          ]
        }
      ],
      "leaf_page_entries": [
        {
          "column": "segment2",
          "name": "Function"
        },
        {
          "column": "segment3",
          "name": "Department"
        },
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "segment4",
          "name": "Division"
        },
        {
          "column": "organization",
          "name": "Organisation"
        },
        {
          "column": "object",
          "name": "Budget Object"
        },
        {
          "column": "charactercodedescription",
          "name": "Character Code"
        },
        {
          "column": "accountdescription",
          "name": "Account Description"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "accounttype",
          "name": "Account Type",
          "renderType": "text"
        },
        {
          "column": "fund",
          "name": "Fund",
          "renderType": "text"
        },
        {
          "column": "actual",
          "name": "Actual Spending",
          "renderType": "number"
        }
      ]
    },
    {
      "name": "Expense Details",
      "dataset_domain": "portlandme.data.socrata.com",
      "dataset_id": "drvx-98uq",
      "fields": {
        "date_column": "date"
      },
      "parent_queries": [
        "select * where accounttype = 'Expense' and accountstatus = 'Active'"
      ],
      "dimension_entries": [
        {
          "column": "segment2",
          "name": "Function"
        },
        {
          "column": "segment3",
          "name": "Department"
        },
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "segment4",
          "name": "Division"
        },
        {
          "column": "organization",
          "name": "Organisation"
        },
        {
          "column": "object",
          "name": "Budget Object"
        },
        {
          "column": "charactercodedescription",
          "name": "Character Code"
        },
        {
          "column": "vendorname",
          "name": "Vendor"
        }
      ],
      "view_entries": [
        {
          "name": "Average Invoice Days Open",
          "primary_metric_name": "Days",
          "column": "daysopen",
          "aggregate_type": "avg",
          "prefix": "",
          "suffix": "",
          "precision": "0",
          "tags": [
            "Budget & Expenditures"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "false",
              "barchart": {
                "default_secondary_metric": "Revised Budget"
              }
            },
            "overtime": {
              "default_view": "area",
              "show_area_chart": "true",
              "show_burn_up_chart": "false",
              "show_timeline_total": "true",
              "timeline": {
                "default_time_frame": "year_on_year",
                "default_compare_year": "2019"
              }
            }
          },
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">",
              "value": "1000",
              "icon": "icons-check-circle",
              "target_entry_description": "Spending is currently on track to remain within budgeted levels ($332 million for FY20)."
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Percentage of Invoices Paid within 30 Days",
          "primary_metric_name": "Days",
          "column": "(sum(case(daysopen <= 30, 1, true, 0))/count(daysopen))*100",
          "aggregate_type": "",
          "prefix": "",
          "suffix": "%",
          "precision": "0",
          "tags": [
            "Budget & Expenditures"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "false",
              "barchart": {
                "default_secondary_metric": "Revised Budget"
              }
            },
            "overtime": {
              "default_view": "area",
              "show_area_chart": "true",
              "show_burn_up_chart": "false",
              "show_timeline_total": "true",
              "timeline": {
                "default_time_frame": "year_on_year",
                "default_compare_year": "2019"
              }
            }
          },
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">",
              "value": "1000",
              "icon": "icons-check-circle",
              "target_entry_description": "Spending is currently on track to remain within budgeted levels ($332 million for FY20)."
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Retirement Payouts",
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
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "barChart",
              "show_pie_chart": "false",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "actual",
                    "name": "Actuals",
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
              "default_view": "timeline",
              "show_area_chart": "true",
              "show_burn_up_chart": "true",
              "show_timeline_total": "true",
              "timeline": {
                "default_time_frame": "year_on_year",
                "default_compare_year": "2019",
                "secondary_metric_entries": [
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  }
                ]
              },
              "burn_up": {
                "default_time_frame": "rolling",
                "default_compare_year": "2019",
                "secondary_metric_entries": [
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  }
                ]
              }
            }
          },
          "parent_queries": [
            "select * where object like '%Retire%'"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">",
              "value": "1000",
              "icon": "icons-check-circle",
              "target_entry_description": "Spending is currently on track to remain within budgeted levels ($332 million for FY20)."
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "External Vendor Payments",
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
              "barchart": {}
            },
            "overtime": {
              "default_view": "burn_up",
              "show_area_chart": "true",
              "show_burn_up_chart": "true",
              "show_timeline_total": "true",
              "timeline": {
                "secondary_metric_entries": [
                  {
                    "column": "actual",
                    "name": "Actuals",
                    "aggregate_type": "sum",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "2"
                  }
                ]
              },
              "burn_up": {
                "default_time_frame": "year_on_year",
                "default_compare_year": "2019"
              }
            }
          },
          "parent_queries": [
            "select * where employee = 'false' and vendorname != 'NULL'"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "<",
              "value": "1000",
              "icon": "icons-check-circle"
            }
          ]
        }
      ],
      "leaf_page_entries": [
        {
          "column": "segment2",
          "name": "Function"
        },
        {
          "column": "segment3",
          "name": "Department"
        },
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "segment4",
          "name": "Division"
        },
        {
          "column": "organization",
          "name": "Organisation"
        },
        {
          "column": "object",
          "name": "Budget Object"
        },
        {
          "column": "charactercodedescription",
          "name": "Character Code"
        },
        {
          "column": "accountdescription",
          "name": "Account Description"
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
      "dataset_domain": "portlandme.data.socrata.com",
      "dataset_id": "8mx7-tp5t",
      "fields": {
        "date_column": "fiscalmonth"
      },
      "dimension_entries": [
        {
          "column": "segment2",
          "name": "Function"
        },
        {
          "column": "segment3",
          "name": "Department"
        },
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "segment4",
          "name": "Division"
        },
        {
          "column": "organization",
          "name": "Organisation"
        },
        {
          "column": "object",
          "name": "Budget Object"
        },
        {
          "column": "charactercodedescription",
          "name": "Character Code"
        },
        {
          "column": "accountdescription",
          "name": "Account Description"
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
            "select * where charactercodedescription = 'Prop & Excise Taxes'"
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
        },
        {
          "name": "School Revenues vs. Budget",
          "column": "actual",
          "parent_queries": [
            "select * where entity = 'School'"
          ],
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Revenue & Tax",
            "Schools"
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
          },
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">",
              "value": "1000",
              "icon": "icons-check-circle",
              "target_entry_description": "Water Resources revenues are currently on track to exceed plan (projected $62.5 million against a $54.3m target)."
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "City Revenues vs. Budget",
          "column": "actual",
          "parent_queries": [
            "select * where entity = 'City'"
          ],
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Revenue & Tax",
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
          },
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": ">",
              "value": "1000",
              "icon": "icons-check-circle",
              "target_entry_description": "Water Resources revenues are currently on track to exceed plan (projected $62.5 million against a $54.3m target)."
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
        },
        {
          "name": "Jetport Revenues vs. Budget",
          "column": "actual",
          "parent_queries": [
            "select * where organization = 'Jetport'"
          ],
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Revenue & Tax",
            "Jetport"
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
          "column": "segment2",
          "name": "Function"
        },
        {
          "column": "segment3",
          "name": "Department"
        },
        {
          "column": "fund",
          "name": "Fund"
        },
        {
          "column": "segment4",
          "name": "Division"
        },
        {
          "column": "organization",
          "name": "Organisation"
        },
        {
          "column": "object",
          "name": "Budget Object"
        },
        {
          "column": "charactercodedescription",
          "name": "Character Code"
        },
        {
          "column": "accountdescription",
          "name": "Account Description"
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
      "dataset_domain": "portlandme.data.socrata.com",
      "dataset_id": "4fix-tsif",
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
              "field": "quick_filter_1_4fix-tsif_0",
              "type": "text",
              "values": [
                "OVERTIME"
              ],
              "operator": "="
            }
          ]
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
      "name": "Employee Details",
      "dataset_domain": "portlandme.data.socrata.com",
      "dataset_id": "9e9t-jury",
      "fields": {
        "date_column": "last_updated_date"
      },
      "dimension_entries": [
        {
          "column": "primaryjobclass",
          "name": "Primary Job Class"
        },
        {
          "column": "primarygroupbargainingunit",
          "name": "Primary Bargaining Unit"
        },
        {
          "column": "primarylocation",
          "name": "Primary Location"
        },
        {
          "column": "personnelstatus",
          "name": "Personnel Status"
        },
        {
          "column": "gender",
          "name": "Gender"
        },
        {
          "column": "fullname",
          "name": "Employee Name"
        }
      ],
      "view_entries": [
        {
          "name": "Headcount",
          "column": "employeeid",
          "parent_queries": [
            "select * where activestatus = 'ACTIVE'"
          ],
          "aggregate_type": "count",
          "prefix": "",
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
                    "column": "employeeannualcompensation",
                    "name": "Average Annual Salary",
                    "aggregate_type": "avg",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "",
                    "render_type": "bullet"
                  }
                ],
                "default_secondary_metric": "Annual Salary"
              }
            }
          }
        },
        {
          "name": "Average Years of Service",
          "column": "date_diff_d(last_updated_date, servicedate) / 365",
          "parent_queries": [
            "select * where activestatus = 'ACTIVE'"
          ],
          "aggregate_type": "avg",
          "prefix": "",
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
                    "column": "employeeannualsalary",
                    "name": "Average Annual Salary",
                    "aggregate_type": "avg",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "",
                    "render_type": "bullet"
                  },
                  {
                    "column": "totalinternalyearsofservice",
                    "name": "Internal Years of Service",
                    "aggregate_type": "sum",
                    "prefix": "",
                    "suffix": "",
                    "precision": "",
                    "render_type": "bullet"
                  },
                  {
                    "column": "employeeage",
                    "name": "Employee Age",
                    "aggregate_type": "sum",
                    "prefix": "",
                    "suffix": "",
                    "precision": "",
                    "render_type": "bullet"
                  }
                ],
                "default_secondary_metric": "Average Annual Salary"
              }
            }
          }
        },
        {
          "name": "Avg. Age + Years of Service",
          "column": "employeeage + (date_diff_d(last_updated_date, servicedate) / 365)",
          "parent_queries": [
            "select * where activestatus = 'ACTIVE'"
          ],
          "aggregate_type": "avg",
          "prefix": "",
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
                    "column": "employeeannualsalary",
                    "name": "Average Annual Salary",
                    "aggregate_type": "avg",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "",
                    "render_type": "bullet"
                  },
                  {
                    "column": "date_diff_d(last_updated_date, servicedate) / 365",
                    "name": "Years of Service",
                    "aggregate_type": "sum",
                    "prefix": "",
                    "suffix": "",
                    "precision": "",
                    "render_type": "bullet"
                  },
                  {
                    "column": "employeeage",
                    "name": "Employee Age",
                    "aggregate_type": "sum",
                    "prefix": "",
                    "suffix": "",
                    "precision": "",
                    "render_type": "bullet"
                  }
                ],
                "bench_mark_entries": [
                  {
                    "value": "80",
                    "name": "Rule of Eighty"
                  },
                  {
                    "value": "90",
                    "name": "Rule of Ninety"
                  }
                ],
                "default_secondary_metric": "Average Annual Salary"
              }
            }
          }
        },
        {
          "name": "Retirement Eligibility (Rule of 80)",
          "column": "(sum(case(employeeage + (date_diff_d(last_updated_date, servicedate) / 365) > 80, 1, true, 0)) / count(employeeid))*100",
          "parent_queries": [
            "select * where activestatus = 'ACTIVE'"
          ],
          "aggregate_type": "",
          "prefix": "",
          "suffix": "%",
          "precision": "0",
          "tags": [
            "Payroll & HR"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "default_view": "scatterplot",
              "chart_type": "scatterplot",
              "show_pie_chart": "false",
              "scatterplot": {
                "secondary_metric_entries": [
                  {
                    "column": "employeeid",
                    "name": "Number of Employees",
                    "aggregate_type": "count",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  },
                  {
                    "column": "date_diff_d(last_updated_date, servicedate) / 365",
                    "name": "Years of Service",
                    "aggregate_type": "sum",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  },
                  {
                    "column": "employeeage",
                    "name": "Employee Age",
                    "aggregate_type": "sum",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  }
                ]
              }
            }
          }
        },
        {
          "name": "Retirement Eligibility (Rule of 90)",
          "column": "(sum(case(employeeage + (date_diff_d(last_updated_date, servicedate) / 365) > 90, 1, true, 0)) / count(employeeid))*100",
          "parent_queries": [
            "select * where activestatus = 'ACTIVE'"
          ],
          "aggregate_type": "",
          "prefix": "",
          "suffix": "%",
          "precision": "0",
          "tags": [
            "Payroll & HR"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "default_view": "scatterplot",
              "chart_type": "barChart",
              "show_pie_chart": "false",
              "barchart": {
                "secondary_metric_entries": [
                  {
                    "column": "employeeannualsalary",
                    "name": "Average Annual Salary",
                    "aggregate_type": "avg",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "",
                    "render_type": "bullet"
                  },
                  {
                    "column": "totaloverallyearsofservice",
                    "name": "Years of Service",
                    "aggregate_type": "sum",
                    "prefix": "",
                    "suffix": "",
                    "precision": "",
                    "render_type": "bullet"
                  },
                  {
                    "column": "employeeage",
                    "name": "Employee Age",
                    "aggregate_type": "sum",
                    "prefix": "",
                    "suffix": "",
                    "precision": "",
                    "render_type": "bullet"
                  }
                ]
              },
              "scatterplot": {
                "secondary_metric_entries": [
                  {
                    "column": "employeeid",
                    "name": "Number of Employees",
                    "aggregate_type": "count",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  },
                  {
                    "column": "totaloverallyearsofservice",
                    "name": "Years of Service",
                    "aggregate_type": "sum",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  },
                  {
                    "column": "employeeage",
                    "name": "Employee Age",
                    "aggregate_type": "sum",
                    "prefix": "",
                    "suffix": "",
                    "precision": ""
                  }
                ]
              }
            }
          }
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
      "name": "Employee Turnover",
      "dataset_domain": "portlandme.data.socrata.com",
      "dataset_id": "9e9t-jury",
      "fields": {
        "date_column": "inactivedate"
      },
      "dimension_entries": [
        {
          "column": "primaryjobclass",
          "name": "Primary Job Class"
        },
        {
          "column": "primarygroupbargainingunit",
          "name": "Primary Bargaining Unit"
        },
        {
          "column": "inactivereason",
          "name": "Inactive Reason"
        },
        {
          "column": "personnelstatus",
          "name": "Personnel Status"
        },
        {
          "column": "gender",
          "name": "Gender"
        },
        {
          "column": "fullname",
          "name": "Employee Name"
        }
      ],
      "view_entries": [
        {
          "name": "Retirements & Resignations",
          "column": "employeeid",
          "parent_queries": [
            "select * where inactivedate IS NOT NULL"
          ],
          "aggregate_type": "count",
          "prefix": "",
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
                    "column": "employeeannualsalary",
                    "name": "Average Annual Salary",
                    "aggregate_type": "avg",
                    "prefix": "$",
                    "suffix": "",
                    "precision": "",
                    "render_type": "bullet"
                  }
                ]
              }
            }
          }
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
      "dataset_domain": "portlandme.data.socrata.com",
      "dataset_id": "89jm-4cm3",
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
      "name": "Bids per Opportunity",
      "dataset_domain": "portlandme.data.socrata.com",
      "dataset_id": "c3bq-eivp",
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
      "dataset_domain": "portlandme.data.socrata.com",
      "dataset_id": "y3ez-h7va",
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
    },{
      "name": "City of Portland Property Data",
      "description": "Assessor's Office",
      "dataset_domain": "portlandme.data.socrata.com",
      "dataset_id": "kx7n-ab4t",
      "parent_queries": [
        "select *,:@computed_region_x8fa_hvzr,avg(sale_ratio) over (partition by land_use_code) as median_sale_ratio, 1-sale_ratio/median_sale_ratio as sale_ratio_deviation_from_median"
      ],
      "fields": {
        "date_column": "sale_date",
        "incident_type": "land_use_code",
        "location": "geocoded_column",
        "x8fa-hvzr": ":@computed_region_x8fa_hvzr"
      },
      "dimension_entries": [
        {
          "column": "class_super",
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
          "end_date_override_and_ignore":"true",
          "start_date_override_and_ignore":"true",
          "tags": [
            "Assessor"
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
            "Assessor"
          ],
          "parent_queries": [
        "select *,:@computed_region_x8fa_hvzr where sale_validity in ('0','V')"

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
            "Assessor"
          ],
          "parent_queries": [
        "select *,:@computed_region_x8fa_hvzr where sale_validity in ('0','V')"

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
            "Assessor"
          ],
          "parent_queries": [
        "select *,:@computed_region_x8fa_hvzr,avg(sale_ratio) over (partition by land_use_code) as median_sale_ratio, 1-sale_ratio/median_sale_ratio as sale_ratio_deviation_from_median where sale_validity in ('0','V')"

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
            "Assessor"
          ],
          "parent_queries": [
        "select *,:@computed_region_x8fa_hvzr where sale_validity in ('0','V')"

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
            "Assessor"
          ],
          "parent_queries": [
        "select *,:@computed_region_x8fa_hvzr,avg(sale_ratio) over (partition by land_use_code) as median_sale_ratio, 1-sale_ratio/median_sale_ratio as sale_ratio_deviation_from_median where sale_validity in ('0','V')"

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
            "Assessor"
          ],
          "parent_queries": [
        "select *,:@computed_region_x8fa_hvzr where sale_validity in ('0','V')"

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
            "Assessor"
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
            "select *, :@computed_region_x8fa_hvzr, case(sale_date between {START_DATE} and {END_DATE} ,1,true,0) as has_sold"
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
        "centerLat": "43.680768,",
        "centerLng": "-70.294197",
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
          "shape_dataset_domain": "portlandme.data.socrata.com",
          "shape_dataset_id": "x8fa-hvzr",
          "shape_name": "City of Portland Zip Codes",
          "fields": {
            "shape": "the_geom",
            "shape_id": "_feature_id",
            "shape_name": "geoid10",
            "shape_description": "geoid10"
          },
          "color": "#32a889",
          "border_color": "#cccccc",
          "mini_map_border_color": "#4d4e4f",
          "outline_highlight_color": "#808080"
        }
      ]
    },
    {
      "name": "Permitting",
      "description": "Permitting",
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
          "column": "permitworkclass",
          "name": "Permit Class"
        }
      ],
      "group_by_entries": [
        {
          "column": "permittypegroup",
          "name": "Permit Type"
        },
        {
          "column": "permitworkclass",
          "name": "Permit Class"
        },
        {
          "column": "projectname",
          "name": "Project"
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
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "permits",
          "tags": [
            "Permitting"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          },
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
            },
           "overtime": {
     "timeline": {
    "default_time_frame": "year_on_year"
    }
    }
          },
          "fields": {
            "date_column": "applicationdate"
          }
        },
        {
          "name": "Open Permit Applications",
          "column": "permitid",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "end_date_override_and_ignore":"true",
          "start_date_boolean_override":"<",
          "parent_queries": [
            "select *,:@computed_region_8t69_jvh8 where permitstatus not in ('Finaled','Issued')"
          ],
          "tags": [
            "Code Enforcement"
          ],
          "visualization": {
            "default_view": "snapshot",
            "snapshot": {
              "chart_type": "groupChart"
            }
          }
        },
        {
          "name": "Permits issued Within 30 days",
          "column": "((sum(less_than_30_count)/count(*))::double)*100.00",
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
              "default_view": "scatterplot",
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
          }},
          "fields": {
            "date_column": "applicationdate"
          },
          "parent_queries": [
            "select :@computed_region_8t69_jvh8, location,applicationdate, permitnumber, permittypegroup, permitstatus, permitworkclass, capital_fund_project,projectname, district, applied_to_issued, case(applied_to_issued < 30, 1) as less_than_30_count where isstatusissued='true'"
          ],
          "target_entries": [
            {
              "name": "SLA Met",
              "color": "#259652",
              "operator": ">",
              "value": "90",
              "icon": "icons-check-circle",
              "target_entry_description": "The SLA for this operating metric is being met. The SLA is 90% of permits issued within 30 days."
            },
            {
              "name": "SLA Not Met",
              "color": "#e31219",
              "icon": "icons-times-circle",
              "target_entry_description": "The SLA for this operating metric is not being met. The SLA is 90% of permits issued within 30 days."
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
    }
  ]
}
