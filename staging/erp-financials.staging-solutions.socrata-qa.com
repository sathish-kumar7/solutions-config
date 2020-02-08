{
  "branding": {
    "delimiter": ",",
    "browser_title": "Solutions | ERP | Financials ",
    "title": "Solutions - ERP Financials"
  },
  "date_options": {
    "type": "yearly",
    "default_year": "2018",
    "year_start_month": "8"
  },
  "tag_list": [
    "Financials",
    "Payroll & HR",
    "Revenue & Tax"
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
            },
            "overtime": {
              "show_area_chart": "false",
              "show_burn_up_chart": "true",
              "show_timeline_total": "true",
              "timeline": {
              "bench_mark_entries": [
                    {
                      "column": "ltdrevisedbudget",
                      "name": "Total revised budget",
                      "aggregate_type": "sum"
                    },
                    {
                      "column": "ltdoriginalbudget",
                      "name": "Total original budget",
                      "aggregate_type": "count"
                    }
                ]
              },
              "burn_up": {
              "bench_mark_entries": [
                    {
                      "column": "ltdrevisedbudget",
                      "name": "Total revised budget",
                      "aggregate_type": "sum"
                    },
                    {
                      "column": "ltdoriginalbudget",
                      "name": "Total original budget",
                      "aggregate_type": "count"
                    }
                ]
              }
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
            },
            "overtime": {
              "show_area_chart": "false",
              "show_burn_up_chart": "true",
              "show_timeline_total": "true",
              "timeline": {
              "bench_mark_entries": [
                    {
                      "column": "ltdrevisedbudget",
                      "name": "Total revised budget",
                      "aggregate_type": "sum"
                    },
                    {
                      "column": "ltdoriginalbudget",
                      "name": "Total original budget",
                      "aggregate_type": "count"
                    }
                ]
              },
              "burn_up": {
              "bench_mark_entries": [
                    {
                      "column": "ltdrevisedbudget",
                      "name": "Total revised budget",
                      "aggregate_type": "sum"
                    },
                    {
                      "column": "ltdoriginalbudget",
                      "name": "Total original budget",
                      "aggregate_type": "count"
                    }
                ]
              }
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
            },
            "overtime": {
              "show_area_chart": "false",
              "show_burn_up_chart": "true",
              "show_timeline_total": "true"
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
            "default_view": "Snapshot",
            "overtime": {
              "show_area_chart": "false",
              "show_burn_up_chart": "false"
            }
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
      "name": "Budget Expenses",
      "dataset_domain": "murfreesboro.data.socrata.com",
      "dataset_id": "tdpw-ufv6",
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
          "column": "segment1",
          "name": "Major Function"
        },
        {
          "column": "segment2",
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
          "name": "Actuals vs. Budget",
          "column": "actuals",
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
              "default_comparison_column_entry": "revisedbudget"
            }
          },
          "comparison_column_entries": [
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
              "column": "originalbudget",
              "name": "Original Budget",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "bullet"
            }
          ]
        },
        {
          "name": "Payroll Expenses vs. Budget",
          "column": "actuals",
          "parent_queries": [
            "select * where segment6 = 'Salary&Benefit Expenditures'"
          ],
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
              "default_comparison_column_entry": "revisedbudget"
            }
          },
          "comparison_column_entries": [
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
              "column": "originalbudget",
              "name": "Original Budget",
              "aggregate_type": "sum",
              "prefix": "$",
              "suffix": "",
              "precision": "2",
              "render_type": "bullet"
            }
          ],
        },
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
            "default_view": "Snapshot",
            "snapshot": {
            "chart_type": "barChart",
            "show_pie_chart": "false",
            "default_comparison_column_entry": "paycategory",
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
            "default_view": "Snapshot"
          },
          "quick_filters": [
              
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
      "name": "ERP - Personnel",
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
            "default_view": "Snapshot",
            "snapshot": {
            "chart_type": "barChart"
            }
          },
          "comparison_column_entries": [
            
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
      "name": "ERP - Bids",
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
          "column": "sum(case(iswomenorminoritybusines='True', 1, true, 0)) / count(bidderid)",
          "aggregate_type": "",
          "prefix": "",
          "suffix": "",
          "precision": "2",
          "tags": [
            
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
            "chart_type": "barChart"
            }
          },
          "comparison_column_entries": [
            
          ]
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
      "name": "ERP - Bids per Oppurtunity",
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
            
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
            "chart_type": "barChart"
            }
          },
          "comparison_column_entries": [
            
          ]
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
      "name": "ERP - Applicants",
      "dataset_domain": "erpinsights.demo.socrata.com",
      "dataset_id": "n5zv-gf3k",
                "parent_queries": [
          "select min(positionopendate) as positionopen_date, min(jobopening) as job_opening, min(city) as city, count(applicantid) as applicant_id, jobopeningrequisitionnumber group by jobopeningrequisitionnumber"
        ],
      "fields": {
        "date_column": "positionopen_date"
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
          "column": "sum(applicant_id)/count(jobopeningrequisitionnumber)",
          "aggregate_type": "",
          "prefix": "",
          "suffix": "",
          "precision": "0",
          "tags": [
            
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
            "chart_type": "barChart"
            }
          },
          "comparison_column_entries": [
            
          ]
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
      "name": "ERP - Vehicle Injury Claims",
      "dataset_domain": "erpinsights.demo.socrata.com",
      "dataset_id": "fuzc-99cp",
      "fields": {
        "date_column": "claimdate"
      },
      "dimension_entries": [
        {
          "column": "claimantcity",
          "name": "Claimant City"
        },       
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "incidenttype",
          "name": "Incident Type"
        },
        {
          "column": "status",
          "name": "Status"
        }
      ],
      "view_entries": [
        {
          "name": "Vehicle Injury Claims Cost",
          "column": "totalrecoveryamount",
          "aggregate_type": "sum",
          "prefix": "",
          "suffix": "",
          "precision": "0",
          "tags": [
            
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
            "chart_type": "barChart"
            }
          },
          "comparison_column_entries": [
            
          ]
        }
      ],
      "leaf_page_entries": [
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "incidenttype",
          "name": "Incident Type"
        },
        {
          "column": "status",
          "name": "Status"
        }
      ]
    },
    {
      "name": "ERP - Property Injury Claims",
      "dataset_domain": "erpinsights.demo.socrata.com",
      "dataset_id": "vfai-azfy",
      "fields": {
        "date_column": "claimdate"
      },
      "dimension_entries": [
        {
          "column": "claimantcity",
          "name": "Claimant City"
        },         
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "incidenttype",
          "name": "Incident Type"
        },
        {
          "column": "status",
          "name": "Status"
        }
      ],
      "view_entries": [
        {
          "name": "Property Injury Claim Cost",
          "column": "totalrecoveryamount",
          "aggregate_type": "sum",
          "prefix": "",
          "suffix": "",
          "precision": "0",
          "tags": [
            
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
            "chart_type": "barChart"
            }
          },
          "comparison_column_entries": [
            
          ]
        }
      ],
      "leaf_page_entries": [
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "incidenttype",
          "name": "Incident Type"
        },
        {
          "column": "status",
          "name": "Status"
        }
      ]
    },
    {
      "name": "ERP - Personal Injury Claims",
      "dataset_domain": "erpinsights.demo.socrata.com",
      "dataset_id": "x44h-hbun",
      "fields": {
        "date_column": "claimdate"
      },
      "dimension_entries": [
        {
          "column": "claimantcity",
          "name": "Claimant City"
        },        
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "incidenttype",
          "name": "Incident Type"
        },
        {
          "column": "status",
          "name": "Status"
        }
      ],
      "view_entries": [
        {
          "name": "Personal Injury Claim Cost",
          "column": "totalrecoveryamount",
          "aggregate_type": "sum",
          "prefix": "",
          "suffix": "",
          "precision": "0",
          "tags": [
            
          ],
          "visualization": {
            "default_view": "Snapshot",
            "snapshot": {
            "chart_type": "barChart"
            }
          },
          "comparison_column_entries": [
            
          ]
        }
      ],
      "leaf_page_entries": [
        {
          "column": "department",
          "name": "Department"
        },
        {
          "column": "incidenttype",
          "name": "Incident Type"
        },
        {
          "column": "status",
          "name": "Status"
        }
      ]
    }
  ]
}
