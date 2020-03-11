{
  "branding": {
    "browser_title": "Portland EnerGov Executive Insights",
    "title": "Portland EnerGov Executive Insights"
  },
    "exploration_card_entries": [
    {
      "name": "Growth Management Plan",
      "link": "https://cityofsfgis.maps.arcgis.com/apps/webappviewer/index.html?id=eecb42437c0042ebb30ecc65e38c6bef",
      "image": "https://www.tylertech.com/Portals/0/Images/Products/CLT-APPRAISAL-Techniques-Prepare-Financial-Support-Download.jpg?ver=2018-09-25-174822-170?format=jpg&quality=80",
      "exploration_content": "View the 2040 comprehensive plan"
    }],
  "tag_list": [
    "Permitting",
    "Planning",
    "Business Services",
    "Code Enforcement",
    "Inspections"
  ],
  "date": {
    "startDate": "2018-1-1",
    "endDate": "2020-01-27"
  },
  "show_share_via_email": true,
  "is_private": "false",
  "template_entries": [
    {
      "name": "Permitting",
      "description": "Permitting",
      "dataset_domain": "portlandme.data.socrata.com",
      "dataset_id": "2yai-kkq6",
      "fields": {
        "date_column": "applicationdate",
        "incident_type": "permittype",
        "location": "location",
        "x8fa-hvzr": ":@computed_region_x8fa_hvzr"
      },
      "dimension_entries": [
        {
          "column": "permittype",
          "name": "Permit Type"
        },
        {
          "column": "permitworkclass",
          "name": "Permit Class"
        }
      ],
      "group_by_entries": [
        {
          "column": "permittype",
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
            "select *,:@computed_region_x8fa_hvzr where permitstatus not in ('Finaled','Issued')"
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
            "select :@computed_region_x8fa_hvzr, location,applicationdate, permitnumber, permittype, permitstatus, permitworkclass, capital_fund_project,projectname, district, applied_to_issued, case(applied_to_issued < 30, 1) as less_than_30_count where isstatusissued='true'"
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
          "column": "permittype",
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
    }
  ]
}
