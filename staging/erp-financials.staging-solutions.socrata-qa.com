{
  "branding": {
    "delimiter": ",",
    "browser_title": "Solutions | ERP | Financials ",
    "title": "Solutions - ERP Financials"
  },
  "tag_list": [
    "Financials",
    "Payroll & HR",
    "Revenue & Tax"
  ],
  "date": {
    "startDate": "2018-07-01",
    "endDate": "2019-06-30"
  },
  "show_share_via_email": true,
  "is_private": "false",
  "template_entries": [
    {
      "name": "ERP - Financials",
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
          "name": "Budget vs. Actuals",
          "column": "ltdrevisedbudget",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Financials"
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
            "chart_type": "barChart",
            "show_pie_chart": "false",
            "default_comparison_column_entry": "actual"
            }
          },
          "comparison_column_entries": [
            {
              "column": "actual",
              "name": "Actual Amount",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "bullet"
            },
            {
              "column": "ltdoriginalbudget",
              "name": "Original budget",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "bullet"
            }
          ]
        },
        {
          "name": "Payroll vs. Budgeted",
          "column": "ltdrevisedbudget",
          "parent_queries": [
            "select * where charactercodedescription = 'FRINGE BENEFITS' OR charactercodedescription = 'SALARY & WAGES'"
          ],
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Payroll & HR"
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
            "chart_type": "barChart",
            "show_pie_chart": "false",
            "default_comparison_column_entry": "actual"
            }
          },
          "comparison_column_entries": [
            {
              "column": "actual",
              "name": "Actual Amount",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "bullet"
            },
            {
              "column": "ltdoriginalbudget",
              "name": "Original budget",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "bullet"
            }
          ]
        },
        {
          "name": "Estimated vs. Actual Revenue",
          "column": "ltdrevisedbudget",
          "parent_queries": [
            "select * where accounttype = 'Revenue'"
          ],
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Revenue & Tax"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "<",
              "value": "1500000000",
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
            "default_view": "Snapshot",
            "snapshot": {
            "chart_type": "barChart",
            "show_pie_chart": "false",
            "default_comparison_column_entry": "actual"
            }
          },
          "comparison_column_entries": [
            {
              "column": "actual",
              "name": "Actual Amount",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "bullet"
            },
            {
              "column": "ltdoriginalbudget",
              "name": "Original budget",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "bullet"
            }
          ]
        },
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
              "operator": "<",
              "value": "2000000000",
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
            "default_view": "Snapshot"
          }
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
            "default_view": "Snapshot",
            "snapshot": {
              "chart_type": "barChart"
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
      "name": "ERP - Payroll",
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
          "column": "firstname",
          "name": "Employee"
        },
        {
          "column": "paycategory",
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
          "precision": "2",
          "tags": [
            "Payroll & HR"
          ],
          "visualization": {
            "default_view": "Snapshot"
          },
          "comparison_column_entries": [
            {
              "column": "paycategory",
              "name": "Pay Type",
              "aggregate_type": "",
              "prefix": "",
              "suffix": "",
              "precision": "",
              "render_type": "stack"
            }
          ]
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
            "default_view": "Snapshot"
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
        },
        {
          "column": "firstname",
          "name": "Employee"
        }
      ],
      "quick_filter_entries": [
        {
          "column": "paycategory",
          "name": "Pay Type",
          "renderType": "text"
        }
      ]
    }
  ]
}
