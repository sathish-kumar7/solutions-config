
 # EnerGov Executive Insights
 ## Permitting 
 Dataset Link: tyler.partner.socrata.com/d/amhj-22i6
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Permit Type | permittypegroup |
 | Project | projectname |
 | Permit Class | permitworkclass |
 | Permit Status | permitstatus |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Permits Issued | `SELECT COUNT(permitid)` | [https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=SELECT COUNT\(permitid\)](https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=SELECT%20COUNT%28permitid%29) | 0.51 |
 | Total Applications Received | `SELECT COUNT(permitid)` | [https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=SELECT COUNT\(permitid\)](https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=SELECT%20COUNT%28permitid%29) | 0.52 |
 | Open Permit Applications | `select *,:@computed_region_8t69_jvh8 where permitstatus not in ('Finaled','Issued')   \|>   SELECT COUNT(permitid)` | [https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=select *,:@computed_region_8t69_jvh8 where permitstatus not in \('Finaled','Issued'\) \|> SELECT COUNT\(permitid\)](https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=select%20%2A%2C%3A%40computed_region_8t69_jvh8%20where%20permitstatus%20not%20in%20%28%27Finaled%27%2C%27Issued%27%29%20%7C%3E%20SELECT%20COUNT%28permitid%29) | 0.79 |
 | Permits issued Within 90 days | `select :@computed_region_8t69_jvh8, location,applicationdate, permitnumber, permittypegroup, permitstatus, permitworkclass, capital_fund_project,projectname, district, applied_to_issued, case(applied_to_issued < 90, 1) as less_than_90_count where isstatusissued='true'   \|>   SELECT (((sum(less_than_90_count)/count(*))::double)*100.00)` | [https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=select :@computed_region_8t69_jvh8, location,applicationdate, permitnumber, permittypegroup, permitstatus, permitworkclass, capital_fund_project,projectname, district, applied_to_issued, case\(applied_to_issued < 90, 1\) as less_than_90_count where isstatusissued='true' \|> SELECT \(\(\(sum\(less_than_90_count\)/count\(*\)\)::double\)*100.00\)](https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=select%20%3A%40computed_region_8t69_jvh8%2C%20location%2Capplicationdate%2C%20permitnumber%2C%20permittypegroup%2C%20permitstatus%2C%20permitworkclass%2C%20capital_fund_project%2Cprojectname%2C%20district%2C%20applied_to_issued%2C%20case%28applied_to_issued%20%3C%2090%2C%201%29%20as%20less_than_90_count%20where%20isstatusissued%3D%27true%27%20%7C%3E%20SELECT%20%28%28%28sum%28less_than_90_count%29/count%28%2A%29%29%3A%3Adouble%29%2A100.00%29) | 0.75 |
 | Permits issued Within 30 days | `select :@computed_region_8t69_jvh8, location,applicationdate, permitnumber, permittypegroup, permitstatus, permitworkclass, capital_fund_project,projectname, district, applied_to_issued, case(applied_to_issued < 30, 1) as less_than_30_count where isstatusissued='true'   \|>   SELECT (((sum(less_than_30_count)/count(*))::double)*100.00)` | [https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=select :@computed_region_8t69_jvh8, location,applicationdate, permitnumber, permittypegroup, permitstatus, permitworkclass, capital_fund_project,projectname, district, applied_to_issued, case\(applied_to_issued < 30, 1\) as less_than_30_count where isstatusissued='true' \|> SELECT \(\(\(sum\(less_than_30_count\)/count\(*\)\)::double\)*100.00\)](https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=select%20%3A%40computed_region_8t69_jvh8%2C%20location%2Capplicationdate%2C%20permitnumber%2C%20permittypegroup%2C%20permitstatus%2C%20permitworkclass%2C%20capital_fund_project%2Cprojectname%2C%20district%2C%20applied_to_issued%2C%20case%28applied_to_issued%20%3C%2030%2C%201%29%20as%20less_than_30_count%20where%20isstatusissued%3D%27true%27%20%7C%3E%20SELECT%20%28%28%28sum%28less_than_30_count%29/count%28%2A%29%29%3A%3Adouble%29%2A100.00%29) | 0.41 |
 | Average # Days from Application to Issuance | `SELECT (avg(applied_to_issued))` | [https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=SELECT \(avg\(applied_to_issued\)\)](https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=SELECT%20%28avg%28applied_to_issued%29%29) | 0.69 |
 | Total Estimated Value of Permitted Construction | `SELECT (sum(permitvaluation))` | [https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=SELECT \(sum\(permitvaluation\)\)](https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=SELECT%20%28sum%28permitvaluation%29%29) | 0.69 |
 ## Inspections 
 Dataset Link: tyler.partner.socrata.com/d/vnvd-qqjp
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Inspection | inspectiontypename |
 | Inspection Status | inspectionstatusname |
 | Inspection Link Name | inspectionlinktypename |
 | Balance due | balancedue |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Open Inspections | `SELECT SUM(case(isstatusindicatesuccess='False', 1, true, 0))` | [https://tyler.partner.socrata.com/resource/vnvd-qqjp.json?$query=SELECT SUM\(case\(isstatusindicatesuccess='False', 1, true, 0\)\)](https://tyler.partner.socrata.com/resource/vnvd-qqjp.json?$query=SELECT%20SUM%28case%28isstatusindicatesuccess%3D%27False%27%2C%201%2C%20true%2C%200%29%29) | 0.66 |
 | Completed Inspections | `SELECT COUNT(inspectionid)` | [https://tyler.partner.socrata.com/resource/vnvd-qqjp.json?$query=SELECT COUNT\(inspectionid\)](https://tyler.partner.socrata.com/resource/vnvd-qqjp.json?$query=SELECT%20COUNT%28inspectionid%29) | 0.6 |
 | Average Delay in Inspection Start Time | `SELECT (avg(actual_start_to_scheduled_start))` | [https://tyler.partner.socrata.com/resource/vnvd-qqjp.json?$query=SELECT \(avg\(actual_start_to_scheduled_start\)\)](https://tyler.partner.socrata.com/resource/vnvd-qqjp.json?$query=SELECT%20%28avg%28actual_start_to_scheduled_start%29%29) | 0.95 |
 ## Business Services 
 Dataset Link: tyler.partner.socrata.com/d/sb4f-xivi
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | License Type | licensetype |
 | Business | doingbusinessas |
 | License Status | licensestatus |
 | License Class | licenseclass |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | License Applications | `SELECT COUNT(licenseid)` | [https://tyler.partner.socrata.com/resource/sb4f-xivi.json?$query=SELECT COUNT\(licenseid\)](https://tyler.partner.socrata.com/resource/sb4f-xivi.json?$query=SELECT%20COUNT%28licenseid%29) | 0.41 |
 | Average Time From Application to Issuance | `SELECT (avg(applied_to_issued))` | [https://tyler.partner.socrata.com/resource/sb4f-xivi.json?$query=SELECT \(avg\(applied_to_issued\)\)](https://tyler.partner.socrata.com/resource/sb4f-xivi.json?$query=SELECT%20%28avg%28applied_to_issued%29%29) | 0.32 |
 | Business License Revenue | `SELECT SUM(balancedue)` | [https://tyler.partner.socrata.com/resource/sb4f-xivi.json?$query=SELECT SUM\(balancedue\)](https://tyler.partner.socrata.com/resource/sb4f-xivi.json?$query=SELECT%20SUM%28balancedue%29) | 0.4 |
 ## Code Cases 
 Dataset Link: tyler.partner.socrata.com/d/sukz-2bfa
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Code Case Type | codecasetypename |
 | Code Case Status | codecasestatusname |
 | District | districtname |
 | Project | projectname |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | New Cases Opened | `SELECT COUNT(codecaseid)` | [https://tyler.partner.socrata.com/resource/sukz-2bfa.json?$query=SELECT COUNT\(codecaseid\)](https://tyler.partner.socrata.com/resource/sukz-2bfa.json?$query=SELECT%20COUNT%28codecaseid%29) | 0.52 |
 | Open Cases | `select *,:@computed_region_8t69_jvh8 where codecasestatusname not in ('Closed')   \|>   SELECT COUNT(codecaseid)` | [https://tyler.partner.socrata.com/resource/sukz-2bfa.json?$query=select *,:@computed_region_8t69_jvh8 where codecasestatusname not in \('Closed'\) \|> SELECT COUNT\(codecaseid\)](https://tyler.partner.socrata.com/resource/sukz-2bfa.json?$query=select%20%2A%2C%3A%40computed_region_8t69_jvh8%20where%20codecasestatusname%20not%20in%20%28%27Closed%27%29%20%7C%3E%20SELECT%20COUNT%28codecaseid%29) | 0.48 |
 | Average Time Open | `SELECT AVG(opened_to_closed)` | [https://tyler.partner.socrata.com/resource/sukz-2bfa.json?$query=SELECT AVG\(opened_to_closed\)](https://tyler.partner.socrata.com/resource/sukz-2bfa.json?$query=SELECT%20AVG%28opened_to_closed%29) | 0.44 |
 | Outstanding Balance Due | `SELECT SUM(balancedue)` | [https://tyler.partner.socrata.com/resource/sukz-2bfa.json?$query=SELECT SUM\(balancedue\)](https://tyler.partner.socrata.com/resource/sukz-2bfa.json?$query=SELECT%20SUM%28balancedue%29) | 0.42 |
 ## Plans 
 Dataset Link: tyler.partner.socrata.com/d/akmz-6gsk
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Plan Type | plantype |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Plan Applications Opened | `SELECT COUNT(applicationdate)` | [https://tyler.partner.socrata.com/resource/akmz-6gsk.json?$query=SELECT COUNT\(applicationdate\)](https://tyler.partner.socrata.com/resource/akmz-6gsk.json?$query=SELECT%20COUNT%28applicationdate%29) | 0.54 |
 | Average Time Open | `SELECT AVG(applied_to_completed)` | [https://tyler.partner.socrata.com/resource/akmz-6gsk.json?$query=SELECT AVG\(applied_to_completed\)](https://tyler.partner.socrata.com/resource/akmz-6gsk.json?$query=SELECT%20AVG%28applied_to_completed%29) | 0.58 |