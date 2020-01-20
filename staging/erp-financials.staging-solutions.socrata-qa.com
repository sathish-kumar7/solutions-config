{
  "branding": {
    "delimiter": ","
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
      "default_view": "Snapshot",
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
          "name": "Original Budget",
          "column": "ltdoriginalbudget",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": ["Budget"]
        },
        {
          "name": "Revised Budget",
          "column": "ltdrevisedbudget",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": ["Budget"]
        },
        {
          "name": "Actual amount",
          "column": "actual",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": ["Budget"]
        },
        {
          "name": "Budget - Operating",
          "column": "actual",
          "aggregate_type": "sum",
          "prefix": "$",
          "suffix": "",
          "precision": "2",
          "tags": ["Budget"],
          "quick_filters": [
          {
            "column": "accounttype",
            "type": "text",
            "field": "quick_filter_0_darw_mart_0",
            "values": ["Expense"],
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
          "tags": ["Budget"],
          "quick_filters": [
          {
            "column": "accounttype",
            "type": "text",
            "field": "quick_filter_0_darw_mart_0",
            "values": ["Revenue"],
            "operator": "="
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
          "tags": ["Budget"],
          "quick_filters": [
          {
            "column": "accounttype",
            "type": "text",
            "field": "quick_filter_0_darw_mart_0",
            "values": ["Balance Sheet"],
            "operator": "="
            }
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
