SELECT * from telco LIMIT 10;

SELECT Churn, count(*) as countt
FROM telco
GROUP by Churn;

SELECT
  sum(case WHEN tenure IS NULL  THEN 1 ELSE 0 END) AS NULL_TENURE,
  sum(CASE WHEN MonthlyCharges IS NULL THEN 1 ELSE 0 END) AS NULL_charges,
  sum(case WHEN Churn IS NULL THEN 1 ELSE 0 END) AS NULL_CHURN
FROM telco;
 
SELECT count(*) as BLANK_TOTAL_CHARGES
FROM telco
WHERE TotalCharges = ' ';

