-- Overall churn rate:
SELECT count(*) as total_customers,
  sum(CHURN_FLAG) as churned,
  round(sum(CHURN_FLAG) * 100.0 / count(*), 2) as churn_rate_pct
from telco_clean;  

-- Churn rate by contract type:
SELECT Contract, count(*) as total_customer,
 sum(churn_flag) as churned,
 round(sum(churn_flag) * 100.0 / count(*), 2) as churn_Rate_pct
from telco_clean
group by Contract
order by Churn_Rate_Pct DESC;

-- Churn rate by tenure group:
SELECT tenure_GROUP,
  count(*) as total,
  sum(churn_flag) as churned,
  round(sum(churn_flag) * 100.0 / count(*), 2) as churn_rate_pct
from telco_clean
group  by tenure_GROUP
order by churn_rate_pct DESC;  

--churn_split_by_contract my own 
SELECT Contract,
       COUNT(*) AS total_customers,
       SUM(CASE 
             WHEN Churn_Flag = 1 AND 
                  ((Contract = 'One year' AND tenure < 12) OR 
                   (Contract = 'Two year' AND tenure < 24)) 
             THEN 1 ELSE 0 END) AS early_exit,
       SUM(CASE 
             WHEN Churn_Flag = 1 AND 
                  ((Contract = 'One year' AND tenure >= 12) OR 
                   (Contract = 'Two year' AND tenure >= 24)) 
             THEN 1 ELSE 0 END) AS non_renewal,
       SUM(CASE WHEN Churn_Flag = 1 AND Contract = 'Month-to-month' 
             THEN 1 ELSE 0 END) AS month_to_month_churn
FROM telco_clean
GROUP BY Contract;

-- Churn rate by payment method:
SELECT PaymentMethod,
 count(*) as total_customers,
 sum(CHURN_FLAG) as churned,
 round(sum(CHURN_FLAG) * 100.0 / count(*), 2) as churn_rate_pct
from telco_clean
group by PaymentMethod
order by churn_rate_pct DESC;

-- Average monthly charges: churned vs stayed: High = Leave, Low = Stay.
SELECT Churn, 
  round(avg(cast(MonthlyCharges as real)), 2) as avg_monthly_charges,
  round(avg(tenure), 1) as avg_tenure_months
from telco_clean
group by  Churn;

-- Churn by internet service type: High speed → High churn, Low speed → Low churn.
SELECT InternetService,
 count(*) as total_customer,
 sum(CHURN_FLAG) as churned,
 round(sum(CHURN_FLAG) * 100.0 / count(*), 2) as churn_rate_pct
from telco_clean
group by InternetService
order by churn_rate_pct DESC; 