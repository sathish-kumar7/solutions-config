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
      "name": "Financials",
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
        }
      ],
      "view_entries": [
        {
          "name": "Total Revenue",
          "column": "actual_amount",
          "aggregate_type": "sum"
        }
      ]
    }
  ]
}
