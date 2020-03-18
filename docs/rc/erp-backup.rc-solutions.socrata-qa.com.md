
 # Solutions - ERP Financials
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
 | Cash Balance | `select * where cashaccount = 'true'   \|>   SELECT SUM(actual)` | [https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select * where cashaccount = 'true' \|> SELECT SUM\(actual\)](https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select%20%2A%20where%20cashaccount%20%3D%20%27true%27%20%7C%3E%20SELECT%20SUM%28actual%29) | 1.12 |
 | General Fund Cash Balance | `select * where cashaccount = 'true' and fund = 'GENERAL FUND'   \|>   SELECT SUM(actual)` | [https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select * where cashaccount = 'true' and fund = 'GENERAL FUND' \|> SELECT SUM\(actual\)](https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select%20%2A%20where%20cashaccount%20%3D%20%27true%27%20and%20fund%20%3D%20%27GENERAL%20FUND%27%20%7C%3E%20SELECT%20SUM%28actual%29) | 0.92 |
 | Unadjusted Net Income | `select *, case(accounttype == 'Revenue', actual, true, 0) as revenue_amount, case(accounttype == 'Expense', actual, true, 0) as expenditures_amount   \|>   SELECT (sum(revenue_amount) - sum(expenditures_amount))` | [https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select *, case\(accounttype == 'Revenue', actual, true, 0\) as revenue_amount, case\(accounttype == 'Expense', actual, true, 0\) as expenditures_amount \|> SELECT \(sum\(revenue_amount\) - sum\(expenditures_amount\)\)](https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select%20%2A%2C%20case%28accounttype%20%3D%3D%20%27Revenue%27%2C%20actual%2C%20true%2C%200%29%20as%20revenue_amount%2C%20case%28accounttype%20%3D%3D%20%27Expense%27%2C%20actual%2C%20true%2C%200%29%20as%20expenditures_amount%20%7C%3E%20SELECT%20%28sum%28revenue_amount%29%20-%20sum%28expenditures_amount%29%29) | 1.33 |
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
 | Actuals vs. Budget | `select * where entity = 'City'   \|>   SELECT SUM(actual)` | [https://murfreesboro.data.socrata.com/resource/tdpw-ufv6.json?$query=select * where entity = 'City' \|> SELECT SUM\(actual\)](https://murfreesboro.data.socrata.com/resource/tdpw-ufv6.json?$query=select%20%2A%20where%20entity%20%3D%20%27City%27%20%7C%3E%20SELECT%20SUM%28actual%29) | 0.72 |
 | Water Resources Actuals vs. Budget | `select * where entity = 'Water Resources'   \|>   SELECT SUM(actual)` | [https://murfreesboro.data.socrata.com/resource/tdpw-ufv6.json?$query=select * where entity = 'Water Resources' \|> SELECT SUM\(actual\)](https://murfreesboro.data.socrata.com/resource/tdpw-ufv6.json?$query=select%20%2A%20where%20entity%20%3D%20%27Water%20Resources%27%20%7C%3E%20SELECT%20SUM%28actual%29) | 0.55 |
 | Payroll Expenses vs. Budget | `select * where segment6 = 'Salary&Benefit Expenditures' and entity = 'City'   \|>   SELECT SUM(actual)` | [https://murfreesboro.data.socrata.com/resource/tdpw-ufv6.json?$query=select * where segment6 = 'Salary&Benefit Expenditures' and entity = 'City' \|> SELECT SUM\(actual\)](https://murfreesboro.data.socrata.com/resource/tdpw-ufv6.json?$query=select%20%2A%20where%20segment6%20%3D%20%27Salary%26Benefit%20Expenditures%27%20and%20entity%20%3D%20%27City%27%20%7C%3E%20SELECT%20SUM%28actual%29) | 0.57 |
 | Water Resources Payroll Expenses vs. Budget | `select * where segment6 = 'Salary&Benefit Expenditures' and entity = 'Water Resources'   \|>   SELECT SUM(actual)` | [https://murfreesboro.data.socrata.com/resource/tdpw-ufv6.json?$query=select * where segment6 = 'Salary&Benefit Expenditures' and entity = 'Water Resources' \|> SELECT SUM\(actual\)](https://murfreesboro.data.socrata.com/resource/tdpw-ufv6.json?$query=select%20%2A%20where%20segment6%20%3D%20%27Salary%26Benefit%20Expenditures%27%20and%20entity%20%3D%20%27Water%20Resources%27%20%7C%3E%20SELECT%20SUM%28actual%29) | 0.82 |
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
 | Revenue vs. Budget | `SELECT SUM(actual)` | [https://murfreesboro.data.socrata.com/resource/wiba-zbm5.json?$query=SELECT SUM\(actual\)](https://murfreesboro.data.socrata.com/resource/wiba-zbm5.json?$query=SELECT%20SUM%28actual%29) | 0.51 |
 | Tax Revenue vs. Budget | `select * where charactercodedescription = 'Local Taxes'   \|>   SELECT SUM(actual)` | [https://murfreesboro.data.socrata.com/resource/wiba-zbm5.json?$query=select * where charactercodedescription = 'Local Taxes' \|> SELECT SUM\(actual\)](https://murfreesboro.data.socrata.com/resource/wiba-zbm5.json?$query=select%20%2A%20where%20charactercodedescription%20%3D%20%27Local%20Taxes%27%20%7C%3E%20SELECT%20SUM%28actual%29) | 1.22 |
 | Water Resources Revenues vs. Budget | `select * where entity = 'Water Resources'   \|>   SELECT SUM(actual)` | [https://murfreesboro.data.socrata.com/resource/wiba-zbm5.json?$query=select * where entity = 'Water Resources' \|> SELECT SUM\(actual\)](https://murfreesboro.data.socrata.com/resource/wiba-zbm5.json?$query=select%20%2A%20where%20entity%20%3D%20%27Water%20Resources%27%20%7C%3E%20SELECT%20SUM%28actual%29) | 0.62 |
 ## Payroll & Compensation 
 Dataset Link: erpinsights.demo.socrata.com/d/dfmt-x4an 
 Parent Queries for dataset are: 

 | Parent Queries |
|--------- |
 | select * where runtype not 'VOID' |
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Bargaining Unit | groupbargainingunit |
 | Job | jobclass |
 | Position | position |
 | Location | location |
 | Employee ID | employeeid |
 | Pay Category | paycategory |
 | Pay Type | paytype |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Total Payroll | `select * where runtype not 'VOID'   \|>   SELECT SUM(payamount)` | [https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=select * where runtype not 'VOID' \|> SELECT SUM\(payamount\)](https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=select%20%2A%20where%20runtype%20not%20%27VOID%27%20%7C%3E%20SELECT%20SUM%28payamount%29) | 0.7 |
 | Total Overtime | `select * where runtype not 'VOID'   \|>   SELECT SUM(payamount)` | [https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=select * where runtype not 'VOID' \|> SELECT SUM\(payamount\)](https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=select%20%2A%20where%20runtype%20not%20%27VOID%27%20%7C%3E%20SELECT%20SUM%28payamount%29) | 0.88 |
 | Headcount | `select * where runtype not 'VOID'   \|>   select employeeid, min(checkdate) as first_checkdate, max(checkdate) as last_checkdate, max(location) as last_location, max(position) as last_position, max(jobclass) as jobclass, max(groupbargainingunit) as groupbargainingunit, max(paycategory) as paycategory, max(paytype) as paytype group by employeeid   \|>   SELECT COUNT(employeeid)` | [https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=select * where runtype not 'VOID' \|> select employeeid, min\(checkdate\) as first_checkdate, max\(checkdate\) as last_checkdate, max\(location\) as last_location, max\(position\) as last_position, max\(jobclass\) as jobclass, max\(groupbargainingunit\) as groupbargainingunit, max\(paycategory\) as paycategory, max\(paytype\) as paytype group by employeeid \|> SELECT COUNT\(employeeid\)](https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=select%20%2A%20where%20runtype%20not%20%27VOID%27%20%7C%3E%20select%20employeeid%2C%20min%28checkdate%29%20as%20first_checkdate%2C%20max%28checkdate%29%20as%20last_checkdate%2C%20max%28location%29%20as%20last_location%2C%20max%28position%29%20as%20last_position%2C%20max%28jobclass%29%20as%20jobclass%2C%20max%28groupbargainingunit%29%20as%20groupbargainingunit%2C%20max%28paycategory%29%20as%20paycategory%2C%20max%28paytype%29%20as%20paytype%20group%20by%20employeeid%20%7C%3E%20SELECT%20COUNT%28employeeid%29) | 0.7 |
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
 | Internal Transfers | `SELECT SUM(case(isdepartmentchanged = 'True', 1, true, 0))` | [https://erpinsights.demo.socrata.com/resource/57n2-v5cf.json?$query=SELECT SUM\(case\(isdepartmentchanged = 'True', 1, true, 0\)\)](https://erpinsights.demo.socrata.com/resource/57n2-v5cf.json?$query=SELECT%20SUM%28case%28isdepartmentchanged%20%3D%20%27True%27%2C%201%2C%20true%2C%200%29%29) | 0.57 |
 | Retirements & Resignations | `select * where action like '%RESIGN%'   \|>   SELECT COUNT(actionhistoryid)` | [https://erpinsights.demo.socrata.com/resource/57n2-v5cf.json?$query=select * where action like '%RESIGN%' \|> SELECT COUNT\(actionhistoryid\)](https://erpinsights.demo.socrata.com/resource/57n2-v5cf.json?$query=select%20%2A%20where%20action%20like%20%27%25RESIGN%25%27%20%7C%3E%20SELECT%20COUNT%28actionhistoryid%29) | 0.95 |
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
 | MBE|WBE Bid % | `SELECT (sum(case(iswomenorminoritybusines='True', 1, true, 0)) / count(bidderid)*100)` | [https://erpinsights.demo.socrata.com/resource/4f5p-ynjv.json?$query=SELECT \(sum\(case\(iswomenorminoritybusines='True', 1, true, 0\)\) / count\(bidderid\)*100\)](https://erpinsights.demo.socrata.com/resource/4f5p-ynjv.json?$query=SELECT%20%28sum%28case%28iswomenorminoritybusines%3D%27True%27%2C%201%2C%20true%2C%200%29%29%20/%20count%28bidderid%29%2A100%29) | 0.41 |
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
 | Bids per Opportunity | `select min(opportunityname) as oppurtunity_name, min(datesubmitted) as date_submitted, min(biddername) as bidder_name, min(requestingdepartment) as requesting_department, count(bidderid) as bidder_count, opportunityid group by opportunityid    \|>   SELECT (sum(bidder_count)/count(opportunityid))` | [https://erpinsights.demo.socrata.com/resource/4f5p-ynjv.json?$query=select min\(opportunityname\) as oppurtunity_name, min\(datesubmitted\) as date_submitted, min\(biddername\) as bidder_name, min\(requestingdepartment\) as requesting_department, count\(bidderid\) as bidder_count, opportunityid group by opportunityid  \|> SELECT \(sum\(bidder_count\)/count\(opportunityid\)\)](https://erpinsights.demo.socrata.com/resource/4f5p-ynjv.json?$query=select%20min%28opportunityname%29%20as%20oppurtunity_name%2C%20min%28datesubmitted%29%20as%20date_submitted%2C%20min%28biddername%29%20as%20bidder_name%2C%20min%28requestingdepartment%29%20as%20requesting_department%2C%20count%28bidderid%29%20as%20bidder_count%2C%20opportunityid%20group%20by%20opportunityid%20%20%7C%3E%20SELECT%20%28sum%28bidder_count%29/count%28opportunityid%29%29) | 0.37 |
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
 | Applicants per Open Position | `select min(jobopening) as job_opening, min(city) as city, count(applicantid) as applicant_id, jobopeningrequisitionnumber where applicationdate between {START_DATE} and {END_DATE} group by jobopeningrequisitionnumber   \|>   SELECT AVG(applicant_id)` | [https://erpinsights.demo.socrata.com/resource/n5zv-gf3k.json?$query=select min\(jobopening\) as job_opening, min\(city\) as city, count\(applicantid\) as applicant_id, jobopeningrequisitionnumber where applicationdate between {START_DATE} and {END_DATE} group by jobopeningrequisitionnumber \|> SELECT AVG\(applicant_id\)](https://erpinsights.demo.socrata.com/resource/n5zv-gf3k.json?$query=select%20min%28jobopening%29%20as%20job_opening%2C%20min%28city%29%20as%20city%2C%20count%28applicantid%29%20as%20applicant_id%2C%20jobopeningrequisitionnumber%20where%20applicationdate%20between%20%7BSTART_DATE%7D%20and%20%7BEND_DATE%7D%20group%20by%20jobopeningrequisitionnumber%20%7C%3E%20SELECT%20AVG%28applicant_id%29) | 0.27 |
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
 | Time to Hire | `SELECT AVG(date_diff_d(hiredate, positionopendate))` | [https://erpinsights.demo.socrata.com/resource/n5zv-gf3k.json?$query=SELECT AVG\(date_diff_d\(hiredate, positionopendate\)\)](https://erpinsights.demo.socrata.com/resource/n5zv-gf3k.json?$query=SELECT%20AVG%28date_diff_d%28hiredate%2C%20positionopendate%29%29) | 0.45 |