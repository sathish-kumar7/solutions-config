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
          "name": "Revised Budget",
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
              },
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
              }
           ]
        },
        {
          "name": "Budget - Operating",
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
            {
              "column": "accounttype",
              "type": "text",
              "field": "quick_filter_0_darw_mart_0",
              "values": [
                "Expense"
              ],
              "operator": "="
            }
          ]
        },
        {
          "name": "Budget - Revenue",
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
            {
              "column": "accounttype",
              "type": "text",
              "field": "quick_filter_0_darw_mart_0",
              "values": [
                "Revenue"
              ],
              "operator": "="
            }
          ],
          "visualization": {
            "default_view": "Snapshot"
          }
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
