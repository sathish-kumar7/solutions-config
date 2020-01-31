{
  "branding": {
    "delimiter": ",",
    "browser_title": "Solutions | ERP | Financials ",
    "title": "Solutions - ERP Financials"
  },
  "tag_list": [
    "Budget"
  ],
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
          "column": "fiscalyear",
          "name": "Fiscal year"
        },
        {
          "column": "accounttype",
          "name": "Account type"
        }
      ],
      "view_entries": [
        {
          "name": "Budget vs Actuals",
          "column": "ltdrevisedbudget",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Budget"
          ],
          "visualization": {
            "default_view": "Snapshot"
          },
          "comparison_column_entries": [
                            {
              "column": "actual",
              "name": "Actual Amount",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "barChart"
              },              
              {
              "column": "actual",
              "name": "Revised vs Actual Amount",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "bullet"
              },
              {
              "column": "ltdoriginalbudget",
              "name": "Original Budget",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "barChart"
              },  
              {
              "column": "ltdoriginalbudget",
              "name": "Revised vs Original budget",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "bullet"
              }
           ]
        },
        {
          "name": "Operating Budget vs Actuals",
          "parentqueries": "Select * where accounttype = 'Expense'",
          "column": "ltdrevisedbudget",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Budget"
          ],
          "target_entries": [
            {
              "name": "On track",
              "color": "#259652",
              "operator": "between",
              "value": "1200000000",
              "to": "1250000000",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ],
          "visualization": {
            "default_view": "Snapshot"
          },
          "quick_filters": [
            
          ],
          "comparison_column_entries": [
                            {
              "column": "actual",
              "name": "Actual Amount",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "barChart"
              },              
              {
              "column": "actual",
              "name": "Expense Budget vs Actual Amount",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "bullet"
              },
              {
              "column": "ltdoriginalbudget",
              "name": "Original Budget",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "barChart"
              },  
              {
              "column": "ltdoriginalbudget",
              "name": "Expense Budget vs Original budget",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "bullet"
              }
           ]
        },
        {
          "name": "Revenue Budget vs Actuals",
          "column": "actual",
          "parentqueries": "Select * where accounttype = 'Revenue'",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Budget"
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
          "quick_filters": [

          ],
          "visualization": {
            "default_view": "Snapshot"
          },
          "comparison_column_entries": [
                            {
              "column": "actual",
              "name": "Actual Amount",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "barChart"
              },              
              {
              "column": "actual",
              "name": "Revenue Budget vs Actual Amount",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "bullet"
              },
              {
              "column": "ltdoriginalbudget",
              "name": "Original Budget",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "barChart"
              },  
              {
              "column": "ltdoriginalbudget",
              "name": "Revenue Budget vs Original budget",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "bullet"
              }
           ]
        },
        {
          "name": "Budget - Cash Accounts",
          "column": "actual",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Budget"
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
          "quick_filters": [
            {
              "column": "accounttype",
              "type": "text",
              "field": "quick_filter_0_darw_mart_0",
              "values": [
                "Balance Sheet"
              ],
              "operator": "="
            }
          ],
          "visualization": {
            "default_view": "Snapshot"
          }
        },
        {
          "name": "Unadjusted Net Income",
          "parent_queries": [
              "select *, case(accounttype == 'Revenue', revisedbudget, true, 0) as revenue_amount, case(accounttype == 'Expense', revisedbudget, true, 0) as expenditures_amount"
          ],
          "column": "sum(revenue_amount) - sum(expenditures_amount)",
          "aggregate_type": "",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Budget"
          ],
          "target_entries": [
              ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
                "chart_type": "barChart"
            }
          }
        },
        {
          "name": "Total Payroll",
          "column": "actual",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": [
            "Budget"
          ],
          "target_entries": [
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
    }
  ]
}
