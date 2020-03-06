
 # Enterprise Executive Insights
 ## Core Financials 
 Dataset Link: erpinsights.demo.socrata.com/d/darw-mart
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Fund | fund |
 | Organisation | organization |
 | Account status | accountstatus |
 | Account type | accounttype |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Cash Balance | `select * where cashaccount = 'true'   \|>   SELECT SUM(actual)` | [https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select * where cashaccount = 'true' \|> SELECT SUM\(actual\)](https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select%20%2A%20where%20cashaccount%20%3D%20%27true%27%20%7C%3E%20SELECT%20SUM%28actual%29) | 0.97 |
 | General Fund Cash Balance | `select * where cashaccount = 'true' and fund = 'GENERAL FUND'   \|>   SELECT SUM(actual)` | [https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select * where cashaccount = 'true' and fund = 'GENERAL FUND' \|> SELECT SUM\(actual\)](https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select%20%2A%20where%20cashaccount%20%3D%20%27true%27%20and%20fund%20%3D%20%27GENERAL%20FUND%27%20%7C%3E%20SELECT%20SUM%28actual%29) | 1.11 |
 | Unadjusted Net Income | `select *, case(accounttype == 'Revenue', actual, true, 0) as revenue_amount, case(accounttype == 'Expense', actual, true, 0) as expenditures_amount   \|>   SELECT (sum(revenue_amount) - sum(expenditures_amount))` | [https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select *, case\(accounttype == 'Revenue', actual, true, 0\) as revenue_amount, case\(accounttype == 'Expense', actual, true, 0\) as expenditures_amount \|> SELECT \(sum\(revenue_amount\) - sum\(expenditures_amount\)\)](https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select%20%2A%2C%20case%28accounttype%20%3D%3D%20%27Revenue%27%2C%20actual%2C%20true%2C%200%29%20as%20revenue_amount%2C%20case%28accounttype%20%3D%3D%20%27Expense%27%2C%20actual%2C%20true%2C%200%29%20as%20expenditures_amount%20%7C%3E%20SELECT%20%28sum%28revenue_amount%29%20-%20sum%28expenditures_amount%29%29) | 1.22 |
 ## Budget Expenses 
 Dataset Link: murfreesboro.data.socrata.com/d/tdpw-ufv6
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Major Function | segment2 |
 | Department | segment3 |
 | Character Code | charactercodedescription |
 | Budget Object | object |
 | Organization | organization |
 | Fund | fund |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Actuals vs. Budget | `select * where entity = 'City'   \|>   SELECT SUM(actual)` | [https://murfreesboro.data.socrata.com/resource/tdpw-ufv6.json?$query=select * where entity = 'City' \|> SELECT SUM\(actual\)](https://murfreesboro.data.socrata.com/resource/tdpw-ufv6.json?$query=select%20%2A%20where%20entity%20%3D%20%27City%27%20%7C%3E%20SELECT%20SUM%28actual%29) | 1.24 |
 | Water Resources Actuals vs. Budget | `select * where entity = 'Water Resources'   \|>   SELECT SUM(actual)` | [https://murfreesboro.data.socrata.com/resource/tdpw-ufv6.json?$query=select * where entity = 'Water Resources' \|> SELECT SUM\(actual\)](https://murfreesboro.data.socrata.com/resource/tdpw-ufv6.json?$query=select%20%2A%20where%20entity%20%3D%20%27Water%20Resources%27%20%7C%3E%20SELECT%20SUM%28actual%29) | 0.5 |
 | Payroll Expenses vs. Budget | `select * where segment6 = 'Salary&Benefit Expenditures' and entity = 'City'   \|>   SELECT SUM(actual)` | [https://murfreesboro.data.socrata.com/resource/tdpw-ufv6.json?$query=select * where segment6 = 'Salary&Benefit Expenditures' and entity = 'City' \|> SELECT SUM\(actual\)](https://murfreesboro.data.socrata.com/resource/tdpw-ufv6.json?$query=select%20%2A%20where%20segment6%20%3D%20%27Salary%26Benefit%20Expenditures%27%20and%20entity%20%3D%20%27City%27%20%7C%3E%20SELECT%20SUM%28actual%29) | 0.51 |
 | Water Resources Payroll Expenses vs. Budget | `select * where segment6 = 'Salary&Benefit Expenditures' and entity = 'Water Resources'   \|>   SELECT SUM(actual)` | [https://murfreesboro.data.socrata.com/resource/tdpw-ufv6.json?$query=select * where segment6 = 'Salary&Benefit Expenditures' and entity = 'Water Resources' \|> SELECT SUM\(actual\)](https://murfreesboro.data.socrata.com/resource/tdpw-ufv6.json?$query=select%20%2A%20where%20segment6%20%3D%20%27Salary%26Benefit%20Expenditures%27%20and%20entity%20%3D%20%27Water%20Resources%27%20%7C%3E%20SELECT%20SUM%28actual%29) | 1.19 |
 ## Budgeted Revenues 
 Dataset Link: murfreesboro.data.socrata.com/d/wiba-zbm5
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Entity | entity |
 | Fund | fund |
 | Major Function | segment2 |
 | Department | segment3 |
 | Character Code | charactercodedescription |
 | Budget Object | object |
 | Organization | organization |
 | Account type | accounttype |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Revenue vs. Budget | `SELECT SUM(actual)` | [https://murfreesboro.data.socrata.com/resource/wiba-zbm5.json?$query=SELECT SUM\(actual\)](https://murfreesboro.data.socrata.com/resource/wiba-zbm5.json?$query=SELECT%20SUM%28actual%29) | 0.56 |
 | Tax Revenue vs. Budget | `select * where charactercodedescription = 'Local Taxes'   \|>   SELECT SUM(actual)` | [https://murfreesboro.data.socrata.com/resource/wiba-zbm5.json?$query=select * where charactercodedescription = 'Local Taxes' \|> SELECT SUM\(actual\)](https://murfreesboro.data.socrata.com/resource/wiba-zbm5.json?$query=select%20%2A%20where%20charactercodedescription%20%3D%20%27Local%20Taxes%27%20%7C%3E%20SELECT%20SUM%28actual%29) | 1.09 |
 ## Payroll & Compensation 
 Dataset Link: erpinsights.demo.socrata.com/d/dfmt-x4an
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Bargaining Unit | groupbargainingunit |
 | Job | jobclass |
 | Position | position |
 | Employee ID | employeeid |
 | Pay Category | paycategory |
 | Pay Type | paytype |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Total Payroll | `SELECT SUM(payamount)` | [https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=SELECT SUM\(payamount\)](https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=SELECT%20SUM%28payamount%29) | 1.23 |
 | Total Overtime | `SELECT SUM(payamount)` | [https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=SELECT SUM\(payamount\)](https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=SELECT%20SUM%28payamount%29) | 1.13 |
 | Headcount | `select employeeid, min(checkdate) as first_checkdate, max(checkdate) as last_checkdate, max(location) as last_location, max(position) as last_position, max(jobclass) as jobclass, max(groupbargainingunit) as groupbargainingunit, max(paycategory) as paycategory, max(paytype) as paytype group by employeeid   \|>   SELECT COUNT(employeeid)` | [https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=select employeeid, min\(checkdate\) as first_checkdate, max\(checkdate\) as last_checkdate, max\(location\) as last_location, max\(position\) as last_position, max\(jobclass\) as jobclass, max\(groupbargainingunit\) as groupbargainingunit, max\(paycategory\) as paycategory, max\(paytype\) as paytype group by employeeid \|> SELECT COUNT\(employeeid\)](https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=select%20employeeid%2C%20min%28checkdate%29%20as%20first_checkdate%2C%20max%28checkdate%29%20as%20last_checkdate%2C%20max%28location%29%20as%20last_location%2C%20max%28position%29%20as%20last_position%2C%20max%28jobclass%29%20as%20jobclass%2C%20max%28groupbargainingunit%29%20as%20groupbargainingunit%2C%20max%28paycategory%29%20as%20paycategory%2C%20max%28paytype%29%20as%20paytype%20group%20by%20employeeid%20%7C%3E%20SELECT%20COUNT%28employeeid%29) | 2.87 |
 ## Employee Actions 
 Dataset Link: erpinsights.demo.socrata.com/d/57n2-v5cf
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Department | department |
 | Job Class | jobclass |
 | Position | position |
 | Action | action |
 | Reason | reason |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Internal Transfers | `SELECT SUM(case(isdepartmentchanged = 'True', 1, true, 0))` | [https://erpinsights.demo.socrata.com/resource/57n2-v5cf.json?$query=SELECT SUM\(case\(isdepartmentchanged = 'True', 1, true, 0\)\)](https://erpinsights.demo.socrata.com/resource/57n2-v5cf.json?$query=SELECT%20SUM%28case%28isdepartmentchanged%20%3D%20%27True%27%2C%201%2C%20true%2C%200%29%29) | 0.51 |
 | Retirements & Resignations | `select * where action like '%RESIGN%'   \|>   SELECT COUNT(actionhistoryid)` | [https://erpinsights.demo.socrata.com/resource/57n2-v5cf.json?$query=select * where action like '%RESIGN%' \|> SELECT COUNT\(actionhistoryid\)](https://erpinsights.demo.socrata.com/resource/57n2-v5cf.json?$query=select%20%2A%20where%20action%20like%20%27%25RESIGN%25%27%20%7C%3E%20SELECT%20COUNT%28actionhistoryid%29) | 0.61 |
 ## Bids 
 Dataset Link: erpinsights.demo.socrata.com/d/4f5p-ynjv
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Oppurtunity Name | opportunityname |
 | Bidder Name | biddername |
 | Requesting Department | requestingdepartment |
 | Is WBE | iswomenorminoritybusines |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | MBE|WBE Bid % | `SELECT (sum(case(iswomenorminoritybusines='True', 1, true, 0)) / count(bidderid)*100)` | [https://erpinsights.demo.socrata.com/resource/4f5p-ynjv.json?$query=SELECT \(sum\(case\(iswomenorminoritybusines='True', 1, true, 0\)\) / count\(bidderid\)*100\)](https://erpinsights.demo.socrata.com/resource/4f5p-ynjv.json?$query=SELECT%20%28sum%28case%28iswomenorminoritybusines%3D%27True%27%2C%201%2C%20true%2C%200%29%29%20/%20count%28bidderid%29%2A100%29) | 0.33 |
 ## Bids per Opportunity 
 Dataset Link: erpinsights.demo.socrata.com/d/4f5p-ynjv 
 Parent Queries for dataset are: 

 | Parent Queries |
|--------- |
 | select min(opportunityname) as oppurtunity_name, min(datesubmitted) as date_submitted, min(biddername) as bidder_name, min(requestingdepartment) as requesting_department, count(bidderid) as bidder_count, opportunityid group by opportunityid  |
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Oppurtunity Name | oppurtunity_name |
 | Bidder Name | bidder_name |
 | Requesting Department | requesting_department |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Bids per Opportunity | `select min(opportunityname) as oppurtunity_name, min(datesubmitted) as date_submitted, min(biddername) as bidder_name, min(requestingdepartment) as requesting_department, count(bidderid) as bidder_count, opportunityid group by opportunityid    \|>   SELECT (sum(bidder_count)/count(opportunityid))` | [https://erpinsights.demo.socrata.com/resource/4f5p-ynjv.json?$query=select min\(opportunityname\) as oppurtunity_name, min\(datesubmitted\) as date_submitted, min\(biddername\) as bidder_name, min\(requestingdepartment\) as requesting_department, count\(bidderid\) as bidder_count, opportunityid group by opportunityid  \|> SELECT \(sum\(bidder_count\)/count\(opportunityid\)\)](https://erpinsights.demo.socrata.com/resource/4f5p-ynjv.json?$query=select%20min%28opportunityname%29%20as%20oppurtunity_name%2C%20min%28datesubmitted%29%20as%20date_submitted%2C%20min%28biddername%29%20as%20bidder_name%2C%20min%28requestingdepartment%29%20as%20requesting_department%2C%20count%28bidderid%29%20as%20bidder_count%2C%20opportunityid%20group%20by%20opportunityid%20%20%7C%3E%20SELECT%20%28sum%28bidder_count%29/count%28opportunityid%29%29) | 0.38 |
 ## Applicants per Open Position 
 Dataset Link: erpinsights.demo.socrata.com/d/n5zv-gf3k 
 Parent Queries for dataset are: 

 | Parent Queries |
|--------- |
 | select min(jobopening) as job_opening, min(city) as city, count(applicantid) as applicant_id, jobopeningrequisitionnumber where applicationdate between {START_DATE} and {END_DATE} group by jobopeningrequisitionnumber |
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Job Opening | job_opening |
 | City | city |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Applicants per Open Position | `select min(jobopening) as job_opening, min(city) as city, count(applicantid) as applicant_id, jobopeningrequisitionnumber where applicationdate between {START_DATE} and {END_DATE} group by jobopeningrequisitionnumber   \|>   SELECT AVG(applicant_id)` | [https://erpinsights.demo.socrata.com/resource/n5zv-gf3k.json?$query=select min\(jobopening\) as job_opening, min\(city\) as city, count\(applicantid\) as applicant_id, jobopeningrequisitionnumber where applicationdate between {START_DATE} and {END_DATE} group by jobopeningrequisitionnumber \|> SELECT AVG\(applicant_id\)](https://erpinsights.demo.socrata.com/resource/n5zv-gf3k.json?$query=select%20min%28jobopening%29%20as%20job_opening%2C%20min%28city%29%20as%20city%2C%20count%28applicantid%29%20as%20applicant_id%2C%20jobopeningrequisitionnumber%20where%20applicationdate%20between%20%7BSTART_DATE%7D%20and%20%7BEND_DATE%7D%20group%20by%20jobopeningrequisitionnumber%20%7C%3E%20SELECT%20AVG%28applicant_id%29) | 0.26 |
 ## Time to Hire 
 Dataset Link: erpinsights.demo.socrata.com/d/n5zv-gf3k
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Job Opening | jobopening |
 | City | city |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Time to Hire | `SELECT AVG(date_diff_d(hiredate, positionopendate))` | [https://erpinsights.demo.socrata.com/resource/n5zv-gf3k.json?$query=SELECT AVG\(date_diff_d\(hiredate, positionopendate\)\)](https://erpinsights.demo.socrata.com/resource/n5zv-gf3k.json?$query=SELECT%20AVG%28date_diff_d%28hiredate%2C%20positionopendate%29%29) | 0.46 |
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
 | Total Applications Received | `SELECT COUNT(permitid)` | [https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=SELECT COUNT\(permitid\)](https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=SELECT%20COUNT%28permitid%29) | 0.51 |
 | Permits issued Within 90 days | `select :@computed_region_8t69_jvh8, location, applicationdate, permitnumber, permittypegroup, permitstatus, permitworkclass, capital_fund_project,projectname, district, applied_to_issued, case(applied_to_issued < 90, 1) as less_than_90_count where isstatusissued='true'   \|>   SELECT (((sum(less_than_90_count)/count(*))::double)*100.00)` | [https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=select :@computed_region_8t69_jvh8, location, applicationdate, permitnumber, permittypegroup, permitstatus, permitworkclass, capital_fund_project,projectname, district, applied_to_issued, case\(applied_to_issued < 90, 1\) as less_than_90_count where isstatusissued='true' \|> SELECT \(\(\(sum\(less_than_90_count\)/count\(*\)\)::double\)*100.00\)](https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=select%20%3A%40computed_region_8t69_jvh8%2C%20location%2C%20applicationdate%2C%20permitnumber%2C%20permittypegroup%2C%20permitstatus%2C%20permitworkclass%2C%20capital_fund_project%2Cprojectname%2C%20district%2C%20applied_to_issued%2C%20case%28applied_to_issued%20%3C%2090%2C%201%29%20as%20less_than_90_count%20where%20isstatusissued%3D%27true%27%20%7C%3E%20SELECT%20%28%28%28sum%28less_than_90_count%29/count%28%2A%29%29%3A%3Adouble%29%2A100.00%29) | 0.72 |
 | Average # Days from Application to Issuance | `SELECT (avg(applied_to_issued))` | [https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=SELECT \(avg\(applied_to_issued\)\)](https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=SELECT%20%28avg%28applied_to_issued%29%29) | 0.53 |
 | Total Estimated Value of Permitted Construction | `SELECT (sum(permitvaluation))` | [https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=SELECT \(sum\(permitvaluation\)\)](https://tyler.partner.socrata.com/resource/amhj-22i6.json?$query=SELECT%20%28sum%28permitvaluation%29%29) | 0.46 |
 ## New Construction 
 Dataset Link: appraisalandtax.demo.socrata.com/d/3sa7-53ay 
 Parent Queries for dataset are: 

 | Parent Queries |
|--------- |
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Class | class |
 | Land Use Code | land_use_code |
 | Neighborhood | nbhd |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Total Parcels with New Construction | `SELECT (count(new_constr_amount))` | [https://appraisalandtax.demo.socrata.com/resource/3sa7-53ay.json?$query=SELECT \(count\(new_constr_amount\)\)](https://appraisalandtax.demo.socrata.com/resource/3sa7-53ay.json?$query=SELECT%20%28count%28new_constr_amount%29%29) | 0.42 |
 | Total Value of New Construction | `SELECT (sum(new_constr_amount))` | [https://appraisalandtax.demo.socrata.com/resource/3sa7-53ay.json?$query=SELECT \(sum\(new_constr_amount\)\)](https://appraisalandtax.demo.socrata.com/resource/3sa7-53ay.json?$query=SELECT%20%28sum%28new_constr_amount%29%29) | 0.41 |
 ## Cobb County Property Data 
 Dataset Link: appraisalandtax.demo.socrata.com/d/n3pu-983n 
 Parent Queries for dataset are: 

 | Parent Queries |
|--------- |
 | select *,:@computed_region_52nt_trix where sale_validity in ('0','00') |
 | select *,:@computed_region_52nt_trix,avg(asr) over (partition by land_use_type) as median_asr, 1-asr/median_asr as asr_deviation_from_median |
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Class | class_cleaned_ |
 | Land Use Type | land_use_type |
 | Style | style |
 | Tax district | taxdist |
 | City | cityname |
 | Grade | grade |
 | Stories | stories |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Average Sales Ratio | `select *,:@computed_region_52nt_trix where sale_validity in ('0','00')   \|>   select *,:@computed_region_52nt_trix,avg(asr) over (partition by land_use_type) as median_asr, 1-asr/median_asr as asr_deviation_from_median   \|>   SELECT AVG(sale_appr_value/case(price <= 0 or price is null, case(sale_appr_value == 0, 1, true, sale_appr_value) , true, price))` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select *,:@computed_region_52nt_trix where sale_validity in \('0','00'\) \|> select *,:@computed_region_52nt_trix,avg\(asr\) over \(partition by land_use_type\) as median_asr, 1-asr/median_asr as asr_deviation_from_median \|> SELECT AVG\(sale_appr_value/case\(price <= 0 or price is null, case\(sale_appr_value == 0, 1, true, sale_appr_value\) , true, price\)\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select%20%2A%2C%3A%40computed_region_52nt_trix%20where%20sale_validity%20in%20%28%270%27%2C%2700%27%29%20%7C%3E%20select%20%2A%2C%3A%40computed_region_52nt_trix%2Cavg%28asr%29%20over%20%28partition%20by%20land_use_type%29%20as%20median_asr%2C%201-asr/median_asr%20as%20asr_deviation_from_median%20%7C%3E%20SELECT%20AVG%28sale_appr_value/case%28price%20%3C%3D%200%20or%20price%20is%20null%2C%20case%28sale_appr_value%20%3D%3D%200%2C%201%2C%20true%2C%20sale_appr_value%29%20%2C%20true%2C%20price%29%29) | 1.62 |
 | Average Absolute Deviation | `select *,:@computed_region_52nt_trix where sale_validity in ('0','00')   \|>   select *,:@computed_region_52nt_trix,avg(asr) over (partition by land_use_type) as median_asr, 1-asr/median_asr as asr_deviation_from_median   \|>   SELECT AVG(asr_deviation_from_median)` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select *,:@computed_region_52nt_trix where sale_validity in \('0','00'\) \|> select *,:@computed_region_52nt_trix,avg\(asr\) over \(partition by land_use_type\) as median_asr, 1-asr/median_asr as asr_deviation_from_median \|> SELECT AVG\(asr_deviation_from_median\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select%20%2A%2C%3A%40computed_region_52nt_trix%20where%20sale_validity%20in%20%28%270%27%2C%2700%27%29%20%7C%3E%20select%20%2A%2C%3A%40computed_region_52nt_trix%2Cavg%28asr%29%20over%20%28partition%20by%20land_use_type%29%20as%20median_asr%2C%201-asr/median_asr%20as%20asr_deviation_from_median%20%7C%3E%20SELECT%20AVG%28asr_deviation_from_median%29) | 1.23 |
 | Coefficient of Dispersion | `select *,:@computed_region_52nt_trix where sale_validity in ('0','00')   \|>   select *,:@computed_region_52nt_trix,avg(asr) over (partition by land_use_type) as median_asr, 1-asr/median_asr as asr_deviation_from_median   \|>   SELECT (avg(asr_deviation_from_median)/avg(median_asr))` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select *,:@computed_region_52nt_trix where sale_validity in \('0','00'\) \|> select *,:@computed_region_52nt_trix,avg\(asr\) over \(partition by land_use_type\) as median_asr, 1-asr/median_asr as asr_deviation_from_median \|> SELECT \(avg\(asr_deviation_from_median\)/avg\(median_asr\)\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select%20%2A%2C%3A%40computed_region_52nt_trix%20where%20sale_validity%20in%20%28%270%27%2C%2700%27%29%20%7C%3E%20select%20%2A%2C%3A%40computed_region_52nt_trix%2Cavg%28asr%29%20over%20%28partition%20by%20land_use_type%29%20as%20median_asr%2C%201-asr/median_asr%20as%20asr_deviation_from_median%20%7C%3E%20SELECT%20%28avg%28asr_deviation_from_median%29/avg%28median_asr%29%29) | 1.45 |
 | Median Ratio | `select *,:@computed_region_52nt_trix where sale_validity in ('0','00')   \|>   select *,:@computed_region_52nt_trix,avg(asr) over (partition by land_use_type) as median_asr, 1-asr/median_asr as asr_deviation_from_median   \|>   SELECT AVG(sale_appr_value/case(price <= 0 or price is null, case(sale_appr_value == 0, 1, true, sale_appr_value) , true, price))` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select *,:@computed_region_52nt_trix where sale_validity in \('0','00'\) \|> select *,:@computed_region_52nt_trix,avg\(asr\) over \(partition by land_use_type\) as median_asr, 1-asr/median_asr as asr_deviation_from_median \|> SELECT AVG\(sale_appr_value/case\(price <= 0 or price is null, case\(sale_appr_value == 0, 1, true, sale_appr_value\) , true, price\)\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select%20%2A%2C%3A%40computed_region_52nt_trix%20where%20sale_validity%20in%20%28%270%27%2C%2700%27%29%20%7C%3E%20select%20%2A%2C%3A%40computed_region_52nt_trix%2Cavg%28asr%29%20over%20%28partition%20by%20land_use_type%29%20as%20median_asr%2C%201-asr/median_asr%20as%20asr_deviation_from_median%20%7C%3E%20SELECT%20AVG%28sale_appr_value/case%28price%20%3C%3D%200%20or%20price%20is%20null%2C%20case%28sale_appr_value%20%3D%3D%200%2C%201%2C%20true%2C%20sale_appr_value%29%20%2C%20true%2C%20price%29%29) | 1.05 |
 | Estimated Total Market Value | `select *,:@computed_region_52nt_trix where sale_validity in ('0','00')   \|>   select *,:@computed_region_52nt_trix,avg(asr) over (partition by land_use_type) as median_asr, 1-asr/median_asr as asr_deviation_from_median   \|>   SELECT SUM(appr_total)` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select *,:@computed_region_52nt_trix where sale_validity in \('0','00'\) \|> select *,:@computed_region_52nt_trix,avg\(asr\) over \(partition by land_use_type\) as median_asr, 1-asr/median_asr as asr_deviation_from_median \|> SELECT SUM\(appr_total\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select%20%2A%2C%3A%40computed_region_52nt_trix%20where%20sale_validity%20in%20%28%270%27%2C%2700%27%29%20%7C%3E%20select%20%2A%2C%3A%40computed_region_52nt_trix%2Cavg%28asr%29%20over%20%28partition%20by%20land_use_type%29%20as%20median_asr%2C%201-asr/median_asr%20as%20asr_deviation_from_median%20%7C%3E%20SELECT%20SUM%28appr_total%29) | 1.13 |
 | Total Sales | `select *,:@computed_region_52nt_trix where sale_validity in ('0','00')   \|>   select *,:@computed_region_52nt_trix,avg(asr) over (partition by land_use_type) as median_asr, 1-asr/median_asr as asr_deviation_from_median   \|>   SELECT COUNT(saledt)` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select *,:@computed_region_52nt_trix where sale_validity in \('0','00'\) \|> select *,:@computed_region_52nt_trix,avg\(asr\) over \(partition by land_use_type\) as median_asr, 1-asr/median_asr as asr_deviation_from_median \|> SELECT COUNT\(saledt\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select%20%2A%2C%3A%40computed_region_52nt_trix%20where%20sale_validity%20in%20%28%270%27%2C%2700%27%29%20%7C%3E%20select%20%2A%2C%3A%40computed_region_52nt_trix%2Cavg%28asr%29%20over%20%28partition%20by%20land_use_type%29%20as%20median_asr%2C%201-asr/median_asr%20as%20asr_deviation_from_median%20%7C%3E%20SELECT%20COUNT%28saledt%29) | 0.88 |
 | % Parcels Sold | `select *,:@computed_region_52nt_trix where sale_validity in ('0','00')   \|>   select *,:@computed_region_52nt_trix,avg(asr) over (partition by land_use_type) as median_asr, 1-asr/median_asr as asr_deviation_from_median   \|>   select *, case(saledt is not null,1,true,0) as has_sold   \|>   SELECT ((sum(has_sold)/258000)::double*100)` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select *,:@computed_region_52nt_trix where sale_validity in \('0','00'\) \|> select *,:@computed_region_52nt_trix,avg\(asr\) over \(partition by land_use_type\) as median_asr, 1-asr/median_asr as asr_deviation_from_median \|> select *, case\(saledt is not null,1,true,0\) as has_sold \|> SELECT \(\(sum\(has_sold\)/258000\)::double*100\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select%20%2A%2C%3A%40computed_region_52nt_trix%20where%20sale_validity%20in%20%28%270%27%2C%2700%27%29%20%7C%3E%20select%20%2A%2C%3A%40computed_region_52nt_trix%2Cavg%28asr%29%20over%20%28partition%20by%20land_use_type%29%20as%20median_asr%2C%201-asr/median_asr%20as%20asr_deviation_from_median%20%7C%3E%20select%20%2A%2C%20case%28saledt%20is%20not%20null%2C1%2Ctrue%2C0%29%20as%20has_sold%20%7C%3E%20SELECT%20%28%28sum%28has_sold%29/258000%29%3A%3Adouble%2A100%29) | 1.48 |
 | % Appealed Value Upheld | `select *,:@computed_region_52nt_trix where sale_validity in ('0','00')   \|>   select *,:@computed_region_52nt_trix,avg(asr) over (partition by land_use_type) as median_asr, 1-asr/median_asr as asr_deviation_from_median   \|>   select * where appealed='true'   \|>   SELECT ((sum(decision_value) / sum(appr_total))*100)` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select *,:@computed_region_52nt_trix where sale_validity in \('0','00'\) \|> select *,:@computed_region_52nt_trix,avg\(asr\) over \(partition by land_use_type\) as median_asr, 1-asr/median_asr as asr_deviation_from_median \|> select * where appealed='true' \|> SELECT \(\(sum\(decision_value\) / sum\(appr_total\)\)*100\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select%20%2A%2C%3A%40computed_region_52nt_trix%20where%20sale_validity%20in%20%28%270%27%2C%2700%27%29%20%7C%3E%20select%20%2A%2C%3A%40computed_region_52nt_trix%2Cavg%28asr%29%20over%20%28partition%20by%20land_use_type%29%20as%20median_asr%2C%201-asr/median_asr%20as%20asr_deviation_from_median%20%7C%3E%20select%20%2A%20where%20appealed%3D%27true%27%20%7C%3E%20SELECT%20%28%28sum%28decision_value%29%20/%20sum%28appr_total%29%29%2A100%29) | 0.81 |
 | % Appealed | `select *,:@computed_region_52nt_trix where sale_validity in ('0','00')   \|>   select *,:@computed_region_52nt_trix,avg(asr) over (partition by land_use_type) as median_asr, 1-asr/median_asr as asr_deviation_from_median   \|>   select *, case(appealed='true',1,true,0) as was_appealed   \|>   SELECT ((sum(was_appealed) / count(*))::double*100)` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select *,:@computed_region_52nt_trix where sale_validity in \('0','00'\) \|> select *,:@computed_region_52nt_trix,avg\(asr\) over \(partition by land_use_type\) as median_asr, 1-asr/median_asr as asr_deviation_from_median \|> select *, case\(appealed='true',1,true,0\) as was_appealed \|> SELECT \(\(sum\(was_appealed\) / count\(*\)\)::double*100\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select%20%2A%2C%3A%40computed_region_52nt_trix%20where%20sale_validity%20in%20%28%270%27%2C%2700%27%29%20%7C%3E%20select%20%2A%2C%3A%40computed_region_52nt_trix%2Cavg%28asr%29%20over%20%28partition%20by%20land_use_type%29%20as%20median_asr%2C%201-asr/median_asr%20as%20asr_deviation_from_median%20%7C%3E%20select%20%2A%2C%20case%28appealed%3D%27true%27%2C1%2Ctrue%2C0%29%20as%20was_appealed%20%7C%3E%20SELECT%20%28%28sum%28was_appealed%29%20/%20count%28%2A%29%29%3A%3Adouble%2A100%29) | 2.39 |