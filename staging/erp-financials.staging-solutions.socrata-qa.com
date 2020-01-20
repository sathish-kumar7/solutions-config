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
          "column": "organization",
          "name": "Organisation"
        },
        {
          "column": "accounttype",
          "name": "Account type"
        },
        {
          "column": "accountstatus",
          "name": "Account status"
        },
        {
          "column": "fiscalyear",
          "name": "Fiscal year"
        }
      ],
      "view_entries": [
        {
          "name": "Original Budget",
          "column": "originalbudget",
          "aggregate_type": "sum",
          "tags": ["Budget"]
        {
          "name": "Revised Budget",
          "column": "revisedbudget",
          "aggregate_type": "sum",
          "tags": ["Budget"]
        },
        {
          "name": "Actual amount",
          "column": "actual",
          "aggregate_type": "sum",
          "tags": ["Budget"]
        }
      ]
    }
  ]
}   
