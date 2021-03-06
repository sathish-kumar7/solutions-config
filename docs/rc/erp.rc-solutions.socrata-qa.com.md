
 # Solutions - ERP Financials
 ## ERP - Financials 
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
 | Budget vs. Actuals | `SELECT SUM(ltdrevisedbudget)` | [https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=SELECT SUM\(ltdrevisedbudget\)](https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=SELECT%20SUM%28ltdrevisedbudget%29) | 1.42 |
 | Payroll vs. Budgeted | `select * where charactercodedescription = 'FRINGE BENEFITS' OR charactercodedescription = 'SALARY & WAGES'   \|>   SELECT SUM(ltdrevisedbudget)` | [https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select * where charactercodedescription = 'FRINGE BENEFITS' OR charactercodedescription = 'SALARY & WAGES' \|> SELECT SUM\(ltdrevisedbudget\)](https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select%20%2A%20where%20charactercodedescription%20%3D%20%27FRINGE%20BENEFITS%27%20OR%20charactercodedescription%20%3D%20%27SALARY%20%26%20WAGES%27%20%7C%3E%20SELECT%20SUM%28ltdrevisedbudget%29) | 1.24 |
 | Estimated vs. Actual Revenue | `select * where accounttype = 'Revenue'   \|>   SELECT SUM(ltdrevisedbudget)` | [https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select * where accounttype = 'Revenue' \|> SELECT SUM\(ltdrevisedbudget\)](https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select%20%2A%20where%20accounttype%20%3D%20%27Revenue%27%20%7C%3E%20SELECT%20SUM%28ltdrevisedbudget%29) | 1.16 |
 | Cash Balance | `select * where cashaccount = 'true'   \|>   SELECT SUM(actual)` | [https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select * where cashaccount = 'true' \|> SELECT SUM\(actual\)](https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select%20%2A%20where%20cashaccount%20%3D%20%27true%27%20%7C%3E%20SELECT%20SUM%28actual%29) | 1.03 |
 | Unadjusted Net Income | `select *, case(accounttype == 'Revenue', actual, true, 0) as revenue_amount, case(accounttype == 'Expense', actual, true, 0) as expenditures_amount   \|>   SELECT (sum(revenue_amount) - sum(expenditures_amount))` | [https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select *, case\(accounttype == 'Revenue', actual, true, 0\) as revenue_amount, case\(accounttype == 'Expense', actual, true, 0\) as expenditures_amount \|> SELECT \(sum\(revenue_amount\) - sum\(expenditures_amount\)\)](https://erpinsights.demo.socrata.com/resource/darw-mart.json?$query=select%20%2A%2C%20case%28accounttype%20%3D%3D%20%27Revenue%27%2C%20actual%2C%20true%2C%200%29%20as%20revenue_amount%2C%20case%28accounttype%20%3D%3D%20%27Expense%27%2C%20actual%2C%20true%2C%200%29%20as%20expenditures_amount%20%7C%3E%20SELECT%20%28sum%28revenue_amount%29%20-%20sum%28expenditures_amount%29%29) | 1.12 |
 ## ERP - Payroll 
 Dataset Link: erpinsights.demo.socrata.com/d/dfmt-x4an
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Job | jobclass |
 | Bargaining Unit | groupbargainingunit |
 | Employment Type | paytype |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Total Payroll | `SELECT SUM(payamount)` | [https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=SELECT SUM\(payamount\)](https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=SELECT%20SUM%28payamount%29) | 2.87 |
 | Total Overtime | `SELECT SUM(payamount)` | [https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=SELECT SUM\(payamount\)](https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=SELECT%20SUM%28payamount%29) | 0.92 |
 | Headcount | `select distinct(employeeid) as distinct_employees, payamount, paytype, checkdate, position, jobclass, firstname, groupbargainingunit   \|>   SELECT COUNT(distinct_employees)` | [https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=select distinct\(employeeid\) as distinct_employees, payamount, paytype, checkdate, position, jobclass, firstname, groupbargainingunit \|> SELECT COUNT\(distinct_employees\)](https://erpinsights.demo.socrata.com/resource/dfmt-x4an.json?$query=select%20distinct%28employeeid%29%20as%20distinct_employees%2C%20payamount%2C%20paytype%2C%20checkdate%2C%20position%2C%20jobclass%2C%20firstname%2C%20groupbargainingunit%20%7C%3E%20SELECT%20COUNT%28distinct_employees%29) | 5.26 |
 ## ERP - Personnel 
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
 | Internal Transfers | `SELECT SUM(case(isdepartmentchanged = 'True', 1, true, 0))` | [https://erpinsights.demo.socrata.com/resource/57n2-v5cf.json?$query=SELECT SUM\(case\(isdepartmentchanged = 'True', 1, true, 0\)\)](https://erpinsights.demo.socrata.com/resource/57n2-v5cf.json?$query=SELECT%20SUM%28case%28isdepartmentchanged%20%3D%20%27True%27%2C%201%2C%20true%2C%200%29%29) | 0.77 |
 ## ERP - Bids 
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
 | MBE|WBE Bid % | `SELECT (sum(case(iswomenorminoritybusines='True', 1, true, 0)) / count(bidderid))` | [https://erpinsights.demo.socrata.com/resource/4f5p-ynjv.json?$query=SELECT \(sum\(case\(iswomenorminoritybusines='True', 1, true, 0\)\) / count\(bidderid\)\)](https://erpinsights.demo.socrata.com/resource/4f5p-ynjv.json?$query=SELECT%20%28sum%28case%28iswomenorminoritybusines%3D%27True%27%2C%201%2C%20true%2C%200%29%29%20/%20count%28bidderid%29%29) | 0.55 |
 ## ERP - Bids per Oppurtunity 
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
 | Bids per Opportunity | `select min(opportunityname) as oppurtunity_name, min(datesubmitted) as date_submitted, min(biddername) as bidder_name, min(requestingdepartment) as requesting_department, count(bidderid) as bidder_count, opportunityid group by opportunityid    \|>   SELECT (sum(bidder_count)/count(opportunityid))` | [https://erpinsights.demo.socrata.com/resource/4f5p-ynjv.json?$query=select min\(opportunityname\) as oppurtunity_name, min\(datesubmitted\) as date_submitted, min\(biddername\) as bidder_name, min\(requestingdepartment\) as requesting_department, count\(bidderid\) as bidder_count, opportunityid group by opportunityid  \|> SELECT \(sum\(bidder_count\)/count\(opportunityid\)\)](https://erpinsights.demo.socrata.com/resource/4f5p-ynjv.json?$query=select%20min%28opportunityname%29%20as%20oppurtunity_name%2C%20min%28datesubmitted%29%20as%20date_submitted%2C%20min%28biddername%29%20as%20bidder_name%2C%20min%28requestingdepartment%29%20as%20requesting_department%2C%20count%28bidderid%29%20as%20bidder_count%2C%20opportunityid%20group%20by%20opportunityid%20%20%7C%3E%20SELECT%20%28sum%28bidder_count%29/count%28opportunityid%29%29) | 0.7 |
 ## ERP - Applicants 
 Dataset Link: erpinsights.demo.socrata.com/d/n5zv-gf3k 
 Parent Queries for dataset are: 

 | Parent Queries |
|--------- |
 | select min(positionopendate) as positionopen_date, min(jobopening) as job_opening, min(city) as city, count(applicantid) as applicant_id, jobopeningrequisitionnumber group by jobopeningrequisitionnumber |
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Job Opening | job_opening |
 | City | city |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Applicants per Open Position | `select min(positionopendate) as positionopen_date, min(jobopening) as job_opening, min(city) as city, count(applicantid) as applicant_id, jobopeningrequisitionnumber group by jobopeningrequisitionnumber   \|>   SELECT (sum(applicant_id)/count(jobopeningrequisitionnumber))` | [https://erpinsights.demo.socrata.com/resource/n5zv-gf3k.json?$query=select min\(positionopendate\) as positionopen_date, min\(jobopening\) as job_opening, min\(city\) as city, count\(applicantid\) as applicant_id, jobopeningrequisitionnumber group by jobopeningrequisitionnumber \|> SELECT \(sum\(applicant_id\)/count\(jobopeningrequisitionnumber\)\)](https://erpinsights.demo.socrata.com/resource/n5zv-gf3k.json?$query=select%20min%28positionopendate%29%20as%20positionopen_date%2C%20min%28jobopening%29%20as%20job_opening%2C%20min%28city%29%20as%20city%2C%20count%28applicantid%29%20as%20applicant_id%2C%20jobopeningrequisitionnumber%20group%20by%20jobopeningrequisitionnumber%20%7C%3E%20SELECT%20%28sum%28applicant_id%29/count%28jobopeningrequisitionnumber%29%29) | 0.54 |