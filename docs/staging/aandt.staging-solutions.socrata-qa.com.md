
 # Assessment Connect
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
 | Average Sales Ratio | `SELECT AVG(sale_appr_value/case(price <= 0 or price is null, case(sale_appr_value == 0, 1, true, sale_appr_value) , true, price))` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=SELECT AVG\(sale_appr_value/case\(price <= 0 or price is null, case\(sale_appr_value == 0, 1, true, sale_appr_value\) , true, price\)\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=SELECT%20AVG%28sale_appr_value/case%28price%20%3C%3D%200%20or%20price%20is%20null%2C%20case%28sale_appr_value%20%3D%3D%200%2C%201%2C%20true%2C%20sale_appr_value%29%20%2C%20true%2C%20price%29%29) | 1.33 |
 | Average Absolute Deviation | `SELECT AVG(asr_deviation_from_median)` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=SELECT AVG\(asr_deviation_from_median\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=SELECT%20AVG%28asr_deviation_from_median%29) | 0.84 |
 | Coefficient of Dispersion | `SELECT (avg(asr_deviation_from_median)/avg(median_asr))` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=SELECT \(avg\(asr_deviation_from_median\)/avg\(median_asr\)\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=SELECT%20%28avg%28asr_deviation_from_median%29/avg%28median_asr%29%29) | 0.47 |
 | Price Relative Differential | `SELECT (avg(asr)/(   sum(sale_appr_value)/sum(price)    ))` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=SELECT \(avg\(asr\)/\(   sum\(sale_appr_value\)/sum\(price\)    \)\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=SELECT%20%28avg%28asr%29/%28%20%20%20sum%28sale_appr_value%29/sum%28price%29%20%20%20%20%29%29) | 1.44 |
 | Median Ratio | `SELECT AVG(sale_appr_value/case(price <= 0 or price is null, case(sale_appr_value == 0, 1, true, sale_appr_value) , true, price))` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=SELECT AVG\(sale_appr_value/case\(price <= 0 or price is null, case\(sale_appr_value == 0, 1, true, sale_appr_value\) , true, price\)\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=SELECT%20AVG%28sale_appr_value/case%28price%20%3C%3D%200%20or%20price%20is%20null%2C%20case%28sale_appr_value%20%3D%3D%200%2C%201%2C%20true%2C%20sale_appr_value%29%20%2C%20true%2C%20price%29%29) | 0.92 |
 | Estimated Total Market Value | `SELECT SUM(appr_total)` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=SELECT SUM\(appr_total\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=SELECT%20SUM%28appr_total%29) | 0.82 |
 | Total Sales | `SELECT COUNT(saledt)` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=SELECT COUNT\(saledt\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=SELECT%20COUNT%28saledt%29) | 0.92 |
 | % Parcels Sold | `select *, case(saledt is not null,1,true,0) as has_sold   \|>   SELECT ((sum(has_sold)/258000)::double*100)` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select *, case\(saledt is not null,1,true,0\) as has_sold \|> SELECT \(\(sum\(has_sold\)/258000\)::double*100\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select%20%2A%2C%20case%28saledt%20is%20not%20null%2C1%2Ctrue%2C0%29%20as%20has_sold%20%7C%3E%20SELECT%20%28%28sum%28has_sold%29/258000%29%3A%3Adouble%2A100%29) | 0.62 |
 | % Appealed Value Upheld | `select * where appealed='true'   \|>   SELECT ((sum(decision_value) / sum(appr_total))*100)` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select * where appealed='true' \|> SELECT \(\(sum\(decision_value\) / sum\(appr_total\)\)*100\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select%20%2A%20where%20appealed%3D%27true%27%20%7C%3E%20SELECT%20%28%28sum%28decision_value%29%20/%20sum%28appr_total%29%29%2A100%29) | 0.84 |
 | % Appealed | `select *, case(appealed='true',1,true,0) as was_appealed   \|>   SELECT ((sum(was_appealed) / count(*))::double*100)` | [https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select *, case\(appealed='true',1,true,0\) as was_appealed \|> SELECT \(\(sum\(was_appealed\) / count\(*\)\)::double*100\)](https://appraisalandtax.demo.socrata.com/resource/n3pu-983n.json?$query=select%20%2A%2C%20case%28appealed%3D%27true%27%2C1%2Ctrue%2C0%29%20as%20was_appealed%20%7C%3E%20SELECT%20%28%28sum%28was_appealed%29%20/%20count%28%2A%29%29%3A%3Adouble%2A100%29) | 0.7 |
 ## Appeals 
 Dataset Link: appraisalandtax.demo.socrata.com/d/22ci-twx5 
 Parent Queries for dataset are: 

 | Parent Queries |
|--------- |
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Class | class |
 | Land Use Type | land_use_type |
 | Commercial Description | com_name |
 | Hearing Type | heartyp |
 | Attorney | attorney |
 | Case Status | case_status |
 | Reason For Appeal | reason_for_appeal |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | % Appealed Value Upheld | `SELECT ((sum(decision_value) / sum(county_value))*100)` | [https://appraisalandtax.demo.socrata.com/resource/22ci-twx5.json?$query=SELECT \(\(sum\(decision_value\) / sum\(county_value\)\)*100\)](https://appraisalandtax.demo.socrata.com/resource/22ci-twx5.json?$query=SELECT%20%28%28sum%28decision_value%29%20/%20sum%28county_value%29%29%2A100%29) | 0.7 |
 | Total Value Under Dispute | `SELECT (sum(county_value)-sum(taxpayer_opinion_value))` | [https://appraisalandtax.demo.socrata.com/resource/22ci-twx5.json?$query=SELECT \(sum\(county_value\)-sum\(taxpayer_opinion_value\)\)](https://appraisalandtax.demo.socrata.com/resource/22ci-twx5.json?$query=SELECT%20%28sum%28county_value%29-sum%28taxpayer_opinion_value%29%29) | 0.5 |
 | Average Value Under Dispute | `SELECT (avg(county_value-taxpayer_opinion_value))` | [https://appraisalandtax.demo.socrata.com/resource/22ci-twx5.json?$query=SELECT \(avg\(county_value-taxpayer_opinion_value\)\)](https://appraisalandtax.demo.socrata.com/resource/22ci-twx5.json?$query=SELECT%20%28avg%28county_value-taxpayer_opinion_value%29%29) | 0.58 |
 | Total Appeals | `SELECT (count(parid))` | [https://appraisalandtax.demo.socrata.com/resource/22ci-twx5.json?$query=SELECT \(count\(parid\)\)](https://appraisalandtax.demo.socrata.com/resource/22ci-twx5.json?$query=SELECT%20%28count%28parid%29%29) | 0.9 |
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
 | Total Parcels with New Construction | `SELECT (count(new_constr_amount))` | [https://appraisalandtax.demo.socrata.com/resource/3sa7-53ay.json?$query=SELECT \(count\(new_constr_amount\)\)](https://appraisalandtax.demo.socrata.com/resource/3sa7-53ay.json?$query=SELECT%20%28count%28new_constr_amount%29%29) | 0.57 |
 | Total Value of New Construction | `SELECT (sum(new_constr_amount))` | [https://appraisalandtax.demo.socrata.com/resource/3sa7-53ay.json?$query=SELECT \(sum\(new_constr_amount\)\)](https://appraisalandtax.demo.socrata.com/resource/3sa7-53ay.json?$query=SELECT%20%28sum%28new_constr_amount%29%29) | 0.46 |
 ## Comp Finder 
 Dataset Link: appraisalandtax.demo.socrata.com/d/3hre-b49k 
 Parent Queries for dataset are: 

 | Parent Queries |
|--------- |
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | County | county |
 | Land Use Code | land_use_code |
 | Building Use | building_use |
 | Owner | owner |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Total Nearby Properties | `SELECT COUNT(parcel_id)` | [https://appraisalandtax.demo.socrata.com/resource/3hre-b49k.json?$query=SELECT COUNT\(parcel_id\)](https://appraisalandtax.demo.socrata.com/resource/3hre-b49k.json?$query=SELECT%20COUNT%28parcel_id%29) | 1.21 |
 | Average Price Per SF | `SELECT AVG(price_per_sf)` | [https://appraisalandtax.demo.socrata.com/resource/3hre-b49k.json?$query=SELECT AVG\(price_per_sf\)](https://appraisalandtax.demo.socrata.com/resource/3hre-b49k.json?$query=SELECT%20AVG%28price_per_sf%29) | 1.06 |