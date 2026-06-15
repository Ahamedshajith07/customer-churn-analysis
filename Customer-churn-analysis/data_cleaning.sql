UPDATE TELCO_CLEAN
SET
  Contract   = trim(Contract),
  PaymentMethod = trim(Contract),
  InternetService = TRIM(InternetService),
  Churn = trim(Churn);
  


UPDATE telco_clean
SET CHURN_FLAG = CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END;   

UPDATE telco_clean
SET tenure_GROUP = CASE 
  WHEN tenure <= 12 THEN '0-12 MONTHS'
  WHEN tenure <= 24 THEN '13-24 MONTHS'
  WHEN tenure <= 48 THEN '25-48 MONTHS'
 ELSE                    '49+ MONTHS' 
END;

SELECT COUNT(*) FROM telco_clean; 

