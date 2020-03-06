
 # Solutions - QA
 ## Opex Budget 
 Dataset Link: evergreen.data.socrata.com/d/s8xp-hq5q
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Service | service |
 | Department | department |
 | Program | program |
 | Category | category |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Funds | `SELECT COUNT(entry_type)` | [https://evergreen.data.socrata.com/resource/s8xp-hq5q.json?$query=SELECT COUNT\(entry_type\)](https://evergreen.data.socrata.com/resource/s8xp-hq5q.json?$query=SELECT%20COUNT%28entry_type%29) | 0.7 |
 | Total amount spent | `SELECT SUM(actual_amount)` | [https://evergreen.data.socrata.com/resource/s8xp-hq5q.json?$query=SELECT SUM\(actual_amount\)](https://evergreen.data.socrata.com/resource/s8xp-hq5q.json?$query=SELECT%20SUM%28actual_amount%29) | 0.51 |
 | Amount spent on Salary And Wages | `SELECT SUM(actual_amount)` | [https://evergreen.data.socrata.com/resource/s8xp-hq5q.json?$query=SELECT SUM\(actual_amount\)](https://evergreen.data.socrata.com/resource/s8xp-hq5q.json?$query=SELECT%20SUM%28actual_amount%29) | 0.59 |
 | Total amount approved | `SELECT SUM(approved_amount)` | [https://evergreen.data.socrata.com/resource/s8xp-hq5q.json?$query=SELECT SUM\(approved_amount\)](https://evergreen.data.socrata.com/resource/s8xp-hq5q.json?$query=SELECT%20SUM%28approved_amount%29) | 0.41 |
 ## Opex Revenue 
 Dataset Link: evergreen.data.socrata.com/d/mik7-qbhe
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Department | department |
 | Source | source |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Total Revenue | `SELECT SUM(actual_amount)` | [https://evergreen.data.socrata.com/resource/mik7-qbhe.json?$query=SELECT SUM\(actual_amount\)](https://evergreen.data.socrata.com/resource/mik7-qbhe.json?$query=SELECT%20SUM%28actual_amount%29) | 0.42 |
 | Total Projections | `SELECT SUM(projected_amount)` | [https://evergreen.data.socrata.com/resource/mik7-qbhe.json?$query=SELECT SUM\(projected_amount\)](https://evergreen.data.socrata.com/resource/mik7-qbhe.json?$query=SELECT%20SUM%28projected_amount%29) | 0.44 |
 ## Capex Budget 
 Dataset Link: evergreen.data.socrata.com/d/dszp-jd2s
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Service | service |
 | Department | department |
 | Project | project |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Approved Amount | `SELECT SUM(approved_amount)` | [https://evergreen.data.socrata.com/resource/dszp-jd2s.json?$query=SELECT SUM\(approved_amount\)](https://evergreen.data.socrata.com/resource/dszp-jd2s.json?$query=SELECT%20SUM%28approved_amount%29) | 0.33 |
 | Actual Amount | `SELECT SUM(actual_amount)` | [https://evergreen.data.socrata.com/resource/dszp-jd2s.json?$query=SELECT SUM\(actual_amount\)](https://evergreen.data.socrata.com/resource/dszp-jd2s.json?$query=SELECT%20SUM%28actual_amount%29) | 0.4 |
 ## Payroll 
 Dataset Link: evergreen.data.socrata.com/d/qu7r-i9cv
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Department | department |
 | Job | position_title |
 | Position Type | position_type |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Annual Total | `SELECT SUM(pay_total)` | [https://evergreen.data.socrata.com/resource/qu7r-i9cv.json?$query=SELECT SUM\(pay_total\)](https://evergreen.data.socrata.com/resource/qu7r-i9cv.json?$query=SELECT%20SUM%28pay_total%29) | 0.47 |
 ## Cobb-Dekalb-Fulton 
 Dataset Link: appraisalandtax.demo.socrata.com/d/3hre-b49k
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Class | class |
 | Owner | owner |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Mean ratio | `SELECT AVG((market_total/case(sale_price == 0,1, true, sale_price)))` | [https://appraisalandtax.demo.socrata.com/resource/3hre-b49k.json?$query=SELECT AVG\(\(market_total/case\(sale_price == 0,1, true, sale_price\)\)\)](https://appraisalandtax.demo.socrata.com/resource/3hre-b49k.json?$query=SELECT%20AVG%28%28market_total/case%28sale_price%20%3D%3D%200%2C1%2C%20true%2C%20sale_price%29%29%29) | 0.61 |
 | Sales | `SELECT COUNT(sale_type)` | [https://appraisalandtax.demo.socrata.com/resource/3hre-b49k.json?$query=SELECT COUNT\(sale_type\)](https://appraisalandtax.demo.socrata.com/resource/3hre-b49k.json?$query=SELECT%20COUNT%28sale_type%29) | 0.62 |
 | Building value | `SELECT SUM(building_value)` | [https://appraisalandtax.demo.socrata.com/resource/3hre-b49k.json?$query=SELECT SUM\(building_value\)](https://appraisalandtax.demo.socrata.com/resource/3hre-b49k.json?$query=SELECT%20SUM%28building_value%29) | 0.71 |
 ## Incidents Data 
 Dataset Link: pinellasparkpd.data.socrata.com/d/qs3a-3222
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Disposition | case_disposition |
 | Officer | reporting_officer_full_name |
 | Status | status |
 | Assigned Bureau | assigned_bureau |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Incidents | `SELECT COUNT(occurred_incident_type)` | [https://pinellasparkpd.data.socrata.com/resource/qs3a-3222.json?$query=SELECT COUNT\(occurred_incident_type\)](https://pinellasparkpd.data.socrata.com/resource/qs3a-3222.json?$query=SELECT%20COUNT%28occurred_incident_type%29) | 0.93 |
 ## Clermont County Property Data 
 Dataset Link: appraisalandtax.demo.socrata.com/d/rf3x-u64k
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Land Use Type | land_use_type |
 | Style | style |
 | Taxdist | taxdist |
 | City | cityname |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Mean Ratio | `SELECT AVG(estimated_total_market_value/case(price <= 0 or price is null, case(estimated_total_market_value == 0, 1, true, estimated_total_market_value) , true, price))` | [https://appraisalandtax.demo.socrata.com/resource/rf3x-u64k.json?$query=SELECT AVG\(estimated_total_market_value/case\(price <= 0 or price is null, case\(estimated_total_market_value == 0, 1, true, estimated_total_market_value\) , true, price\)\)](https://appraisalandtax.demo.socrata.com/resource/rf3x-u64k.json?$query=SELECT%20AVG%28estimated_total_market_value/case%28price%20%3C%3D%200%20or%20price%20is%20null%2C%20case%28estimated_total_market_value%20%3D%3D%200%2C%201%2C%20true%2C%20estimated_total_market_value%29%20%2C%20true%2C%20price%29%29) | 0.44 |
 | Median Ratio | `SELECT MEDIAN(estimated_total_market_value/case(price <= 0 or price is null, case(estimated_total_market_value == 0, 1, true, mktval) , true, price))` | [https://appraisalandtax.demo.socrata.com/resource/rf3x-u64k.json?$query=SELECT MEDIAN\(estimated_total_market_value/case\(price <= 0 or price is null, case\(estimated_total_market_value == 0, 1, true, mktval\) , true, price\)\)](https://appraisalandtax.demo.socrata.com/resource/rf3x-u64k.json?$query=SELECT%20MEDIAN%28estimated_total_market_value/case%28price%20%3C%3D%200%20or%20price%20is%20null%2C%20case%28estimated_total_market_value%20%3D%3D%200%2C%201%2C%20true%2C%20mktval%29%20%2C%20true%2C%20price%29%29) | 0.48 |
 | Estimated Total Market Value | `SELECT SUM(estimated_total_market_value)` | [https://appraisalandtax.demo.socrata.com/resource/rf3x-u64k.json?$query=SELECT SUM\(estimated_total_market_value\)](https://appraisalandtax.demo.socrata.com/resource/rf3x-u64k.json?$query=SELECT%20SUM%28estimated_total_market_value%29) | 0.74 |
 ## Parcels 
 Dataset Link: appraisalandtax.demo.socrata.com/d/rf3x-u64k 
 Parent Queries for dataset are: 

 | Parent Queries |
|--------- |
 | select *,:@computed_region_5ynq_aczk,avg(asr) over (partition by land_use_type='commercial') as median_asr, 1-asr/median_asr as asr_deviation_from_median |
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Syle | style |
 | Grade | grade |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Average Absolute Deviation | `select *,:@computed_region_5ynq_aczk,avg(asr) over (partition by land_use_type='commercial') as median_asr, 1-asr/median_asr as asr_deviation_from_median   \|>   SELECT AVG(asr_deviation_from_median)` | [https://appraisalandtax.demo.socrata.com/resource/rf3x-u64k.json?$query=select *,:@computed_region_5ynq_aczk,avg\(asr\) over \(partition by land_use_type='commercial'\) as median_asr, 1-asr/median_asr as asr_deviation_from_median \|> SELECT AVG\(asr_deviation_from_median\)](https://appraisalandtax.demo.socrata.com/resource/rf3x-u64k.json?$query=select%20%2A%2C%3A%40computed_region_5ynq_aczk%2Cavg%28asr%29%20over%20%28partition%20by%20land_use_type%3D%27commercial%27%29%20as%20median_asr%2C%201-asr/median_asr%20as%20asr_deviation_from_median%20%7C%3E%20SELECT%20AVG%28asr_deviation_from_median%29) | 0.79 |
 | Coefficient of Dispersion | `select *,:@computed_region_5ynq_aczk,avg(asr) over (partition by land_use_type='commercial') as median_asr, 1-asr/median_asr as asr_deviation_from_median   \|>   SELECT (avg(asr_deviation_from_median)/avg(median_asr))` | [https://appraisalandtax.demo.socrata.com/resource/rf3x-u64k.json?$query=select *,:@computed_region_5ynq_aczk,avg\(asr\) over \(partition by land_use_type='commercial'\) as median_asr, 1-asr/median_asr as asr_deviation_from_median \|> SELECT \(avg\(asr_deviation_from_median\)/avg\(median_asr\)\)](https://appraisalandtax.demo.socrata.com/resource/rf3x-u64k.json?$query=select%20%2A%2C%3A%40computed_region_5ynq_aczk%2Cavg%28asr%29%20over%20%28partition%20by%20land_use_type%3D%27commercial%27%29%20as%20median_asr%2C%201-asr/median_asr%20as%20asr_deviation_from_median%20%7C%3E%20SELECT%20%28avg%28asr_deviation_from_median%29/avg%28median_asr%29%29) | 0.5 |
 | Price Relative Differential | `select *,:@computed_region_5ynq_aczk,avg(asr) over (partition by land_use_type='commercial') as median_asr, 1-asr/median_asr as asr_deviation_from_median   \|>   SELECT (avg(asr)/(   sum(estimated_total_market_value)/sum(price)    ))` | [https://appraisalandtax.demo.socrata.com/resource/rf3x-u64k.json?$query=select *,:@computed_region_5ynq_aczk,avg\(asr\) over \(partition by land_use_type='commercial'\) as median_asr, 1-asr/median_asr as asr_deviation_from_median \|> SELECT \(avg\(asr\)/\(   sum\(estimated_total_market_value\)/sum\(price\)    \)\)](https://appraisalandtax.demo.socrata.com/resource/rf3x-u64k.json?$query=select%20%2A%2C%3A%40computed_region_5ynq_aczk%2Cavg%28asr%29%20over%20%28partition%20by%20land_use_type%3D%27commercial%27%29%20as%20median_asr%2C%201-asr/median_asr%20as%20asr_deviation_from_median%20%7C%3E%20SELECT%20%28avg%28asr%29/%28%20%20%20sum%28estimated_total_market_value%29/sum%28price%29%20%20%20%20%29%29) | 1.44 |
 ## ERP metrics 
 Dataset Link: evergreen.data.socrata.com/d/s8xp-hq5q 
 Parent Queries for dataset are: 

 | Parent Queries |
|--------- |
 | select * where service = 'Education' |
 #### Data Dimensions

 | Name | Field Name |
|--------- |--------- |
 | Service | service |
 #### Measures

 | Measure Name | SoQL Query | Example Link | Approximate Query Time (in seconds) |
|--------- |--------- |--------- |--------- |
 | Funds | `select * where service = 'Education'   \|>   SELECT COUNT(entry_type)` | [https://evergreen.data.socrata.com/resource/s8xp-hq5q.json?$query=select * where service = 'Education' \|> SELECT COUNT\(entry_type\)](https://evergreen.data.socrata.com/resource/s8xp-hq5q.json?$query=select%20%2A%20where%20service%20%3D%20%27Education%27%20%7C%3E%20SELECT%20COUNT%28entry_type%29) | 0.45 |