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
    "Water Resources"
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
                ]
              }
            }
          },
          "parent_queries": [
            "select * where segment6 = 'Salary&Benefit Expenditures' and entity = 'City'"
          ]
        },
        {
          "name": "Water Resources Payroll vs. Budget",
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
            "default_view": "snapshot",
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
              }
            }
          },
          "quick_filters": [
            {
              "column": "entity",
              "type": "text",
              "values": [
                "City"
              ],
              "operator": "="
            }
          ]
        },
        {
          "name": "Water Resources Revenues vs. Budget",
          "column": "actual",
          "parent_queries": [
            "select * where entity = 'Water Resources'"
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
          "column": "jobclass",
          "name": "Job"
        },
        {
          "column": "groupbargainingunit",
          "name": "Bargaining Unit"
        },
        {
          "column": "paytype",
          "name": "Employment Type"
        }
      ],
      "view_entries": [
        {
          "name": "Total Payroll",
          "column": "payamount",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
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
          "parent_queries": [
            "select * where action like '%RESIGN%'"
          ],
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
          "comparison_column_entries": []
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
    }
  ]
}
