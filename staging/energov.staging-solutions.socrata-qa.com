{
  "branding": {
    "browser_title": "Solutions | EnerGov ",
    "title": "Solutions - EnerGov"
  },
  "tag_list": [
    "Community Development",
    "Business Services",
    "Code Enforcement"
  ],
  "date": {
    "startDate": "2018-1-1",
    "endDate": "2020-02-01"
  },
  "show_share_via_email": true,
  "is_private": "false",
  "template_entries": [
    {
      "name": "Community Development",
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
          "column": "permitstatus",
          "name": "Permit Status"
        },
        {
          "column": "permitworkclass",
          "name": "Permit Class"
        },
        {
          "column": "projectname",
          "name": "Project"
        }
      ],
      "group_by_entries": [
        {
          "column": "permittypegroup",
          "name": "Permit Type"
        },
        {
          "column": "district",
          "name": "District"
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
            "Community Development"
          ],
       "visualization": {
          "default_view": "Snapshot",
            "snapshot": {
                "chart_type": "groupChart"
            }
        },
         "fields": {
        "date_column": "issueddate"
        },
        "target_entries": [
        {
              "name": "On track",
              "color": "#259652",
              "operator": ">",
              "value": "30",
              "icon": "icons-check-circle"
            },
            {
              "name": "Off track",
              "color": "#e31219",
              "icon": "icons-times-circle"
            }
          ]
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
            "Community Development"
          ],
       "visualization": {
          "default_view": "Snapshot",
            "snapshot": {
                "chart_type": "groupChart"
            }
        },
        "fields": {
        "date_column": "applicationdate"
        },
        "target_entries": [
                {
                  "name": "On track",
                  "color": "#259652",
                  "operator": "<",
                  "value": "200",
                  "icon": "icons-check-circle"
                },
                {
                  "name": "Off track",
                  "color": "#e31219",
                  "icon": "icons-times-circle"
                }
            ]
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
            "Community Development"
          ],
       "visualization": {
          "default_view": "Snapshot",
            "snapshot": {
                "chart_type": "groupChart"
            }
        },
        "fields": {
        "date_column": "applicationdate"
        },
        "parent_queries": [
            "select applicationdate, permitnumber, permittypegroup, permitstatus, permitworkclass, projectname, district, applied_to_issued, case(applied_to_issued < 90, 1) as less_than_90_count where isstatusissued='true'"
          ],
        "target_entries": [
                {
                  "name": "SLA Met",
                  "color": "#259652",
                  "operator": ">",
                  "value": "50",
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
            "Community Development"
          ],
       "visualization": {
          "default_view": "Snapshot",
            "snapshot": {
                "chart_type": "groupChart"
            }
        },
        "target_entries": [
                {
                  "name": "SLA Met",
                  "color": "#259652",
                  "operator": "<",
                  "value": "110",
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
            "Community Development"
          ],
       "visualization": {
          "default_view": "Snapshot",
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
            "shape_id": "_feature_i",
            "shape_name": "repname",
            "shape_description": "repname"
          },
          "color": "#32a889"
        }
      ]
    },
    {
      "name": "Inspections",
      "dataset_domain": "tyler.partner.socrata.com",
      "dataset_id": "vnvd-qqjp",
      "fields": {
        "date_column": "requestdatetime",
        "incident_type": "inspectiontypename",
        "location": "location",
        "8t69-jvh8": ":@computed_region_8t69_jvh8"
      },
      "dimension_entries": [
        {
          "column": "inspectiontypename",
          "name": "Inspection"
        },
        {
          "column": "inspectionstatusname",
          "name": "Inspection Status"
        },
        {
          "column": "inspectionlinktypename",
          "name": "Inspection Link Name"
        },
        {
          "column": "balancedue",
          "name": "Balance due"
        }
      ],
      "view_entries": [
        {
          "name": "Open Inspections",
          "column": "case(isstatusindicatesuccess='False', 1, true, 0)",
          "aggregate_type": "sum",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Code Enforcement"
          ],
       "visualization": {
          "default_view": "Snapshot",
            "snapshot": {
                "chart_type": "barChart"
            }
        }
        },
        {
          "name": "Completed Inspections",
          "column": "inspectionid",
          "aggregate_type": "count",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Code Enforcement"
          ],
       "visualization": {
          "default_view": "Snapshot",
            "snapshot": {
                "chart_type": "barChart"
            }
        },
        "fields": {
        "date_column": "actualenddatetime"
        },
        "target_entries": [
                {
                  "name": "On track",
                  "color": "#259652",
                  "operator": ">",
                  "value": "100000",
                  "icon": "icons-check-circle"
                },
                {
                  "name": "Off track",
                  "color": "#e31219",
                  "icon": "icons-times-circle"
                }
            ]
        },
        {
          "name": "Average Delay in Inspection Start Time",
          "column": "avg(actual_start_to_scheduled_start)",
          "aggregate_type": "",
          "precision": "0",
          "prefix": "",
          "suffix": " days",
          "tags": [
            "Code Enforcement"
          ],
       "visualization": {
          "default_view": "Snapshot",
            "snapshot": {
                "chart_type": "barChart"
            }
        },
        "fields": {
        "date_column": "actualenddatetime"
        },
        "target_entries": [
                {
                  "name": "SLA Met",
                  "color": "#259652",
                  "operator": ">",
                  "value": "10",
                  "icon": "icons-check-circle"
                },
                {
                  "name": "SLA Not Met",
                  "color": "#e31219",
                  "icon": "icons-times-circle"
                }
            ]
        }
      ],
      "leaf_page_entries": [
        {
          "column": "inspectiontypename",
          "name": "Inspection"
        },
        {
          "column": "inspectionstatusname",
          "name": "Inspection Status"
        },
        {
          "column": "inspectionlinktypename",
          "name": "Inspection Link Name"
        },
        {
          "column": "balancedue",
          "name": "Balance due"
        }
      ],
        "map": {
        "centerLat": "43.0481",
        "centerLng": "-76.1474",
        "zoom": "11",
        "mini_map_zoom": "11",
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
            "shape_id": "_feature_i",
            "shape_name": "repname",
            "shape_description": "repname"
          },
          "color": "#32a889"
        }
      ]
    },
    {
      "name": "Business Services",
      "dataset_domain": "tyler.partner.socrata.com",
      "dataset_id": "sb4f-xivi",
      "fields": {
        "date_column": "applicationdate",
        "incident_type": "doingbusinessas",
        "location": "location"
              },
      "dimension_entries": [
        {
          "column": "licensetype",
          "name": "License Type"
        },
        {
          "column": "doingbusinessas",
          "name": "Business"
        },
        {
          "column": "licensestatus",
          "name": "License Status"
        },
        {
          "column": "licenseclass",
          "name": "License Class"
        }
      ],
      "group_by_entries": [
        {
          "column": "district",
          "name": "District"
        },
        {
          "column": "licensetype",
          "name": "License Type"
        }
      ],
      "view_entries": [
        {
          "name": "License Applications",
          "column": "licenseid",
          "aggregate_type": "count",
          "use_dimension_value": "true",
          "precision": "0",
          "prefix": "",
          "suffix": "",
          "tags": [
            "Business Services"
          ],
       "visualization": {
          "default_view": "Snapshot",
            "snapshot": {
                "chart_type": "groupChart"
            }
        },
        "target_entries": [
                {
                  "name": "On track",
                  "color": "#259652",
                  "operator": ">",
                  "value": "1300",
                  "icon": "icons-check-circle"
                },
                {
                  "name": "Off track",
                  "color": "#e31219",
                  "icon": "icons-times-circle"
                }
            ]
        },
        {
          "name": "Business License Revenue",
          "column": "balancedue",
          "aggregate_type": "sum",
          "precision": "0",
          "prefix": "$",
          "suffix": "",
          "tags": [
            "Business Services"
          ],
       "visualization": {
          "default_view": "Snapshot",
            "snapshot": {
                "chart_type": "groupChart"
            }
        },
        "target_entries": [
                {
                  "name": "On track",
                  "color": "#259652",
                  "operator": ">",
                  "value": "1300",
                  "icon": "icons-check-circle"
                },
                {
                  "name": "Off track",
                  "color": "#e31219",
                  "icon": "icons-times-circle"
                }
            ]
        },
        {
          "name": "% of Licenses Renewed On Time",
          "column": "((sum(renewed_on_time)/count(*))::double)*100",
          "aggregate_type": "",
          "precision": "0",
          "prefix": "",
          "suffix": "%",
          "tags": [
            "Business Services"
          ],
       "visualization": {
          "default_view": "Snapshot",
            "snapshot": {
                "chart_type": "groupChart"
            },
        "parent_queries": [
            "select *, case(LastRenewalDate < ExpirationDate, 1) as renewed_on_time where LastRenewalDate is not null"
          ]
        },
        "target_entries": [
                {
                  "name": "On track",
                  "color": "#259652",
                  "operator": ">",
                  "value": "1300",
                  "icon": "icons-check-circle"
                },
                {
                  "name": "Off track",
                  "color": "#e31219",
                  "icon": "icons-times-circle"
                }
            ]
        }
      ],
      "leaf_page_entries": [
        {
          "column": "doingbusinessas",
          "name": "Business"
        },
        {
          "column": "licensestatus",
          "name": "License Status"
        },
        {
          "column": "licenseclass",
          "name": "License Class"
        },
        {
          "column": "licensetype",
          "name": "License Type"
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
      }
    }
  ]
}
