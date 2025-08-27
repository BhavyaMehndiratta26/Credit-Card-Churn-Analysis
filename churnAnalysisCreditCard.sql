-- KPI 1: Overall Churn Rate (What % of customers have churned)
-- Objective: Tells management how big the churn problem is overall.

SELECT
  COUNTIF(Attrition_Flag = 'Attrited Customer') AS churned_customers,
  COUNT(*) AS total_customers,
  COUNTIF(Attrition_Flag = 'Attrited Customer') * 100.0 / SAFE_CAST(COUNT(*) AS FLOAT64) AS churn_rate
FROM `genai-experiments-072025.churn_analysis.credit_card_churn`

-- KPI 2: Comparing Financial behaviour of Churned vs Retained Customers
-- Objective: To show if churned customers were less engaged (lower spend & usage).

SELECT
Attrition_Flag,
AVG(Credit_Limit) AS avg_credit_limit,
AVG(Total_Revolving_Bal) AS avg_revolving_balance,
AVG(Total_Trans_Amt) AS avg_transaction_amount,
AVG(Total_Trans_Ct) AS avg_transaction_count,
AVG(Avg_Utilization_Ratio) AS avg_utilization_ratio
FROM
  `genai-experiments-072025.churn_analysis.credit_card_churn`
GROUP BY
  Attrition_Flag;

-- KPI 3: Churn By Demographics (By Age,Gender,Income)
-- Objective: It helps identify high-risk groups (e.g., low income, certain age).

SELECT 
Gender,
Customer_Age,
Income_Category,
COUNTIF(Attrition_Flag = 'Attrited Customer') * 100 / COUNT(*) AS Churn_Rate_Percent,
COUNT(*) AS total_customers
FROM
`genai-experiments-072025.churn_analysis.credit_card_churn`
GROUP BY 
Gender,Customer_Age, Income_Category
ORDER BY
Churn_Rate_Percent DESC;

-- KPI 4: Churn By Tenure (Does churn happen with new or long-tenured customers?)
-- Objective: It helps to detect if early churn = poor onboarding or late churn = loyalty fatigue.
SELECT
CASE
  WHEN Months_on_book < 24 THEN '< 2 years'
  WHEN Months_on_book BETWEEN 24 AND 48 THEN '2-4 years'
  WHEN Months_on_book BETWEEN 49 AND 72 THEN '4-6 years'
  ELSE '6+ years'
END AS tenure_group,
COUNTIF(Attrition_Flag = 'Attrited Customer') * 100 / COUNT(*) AS Churn_Rate_Percent,
COUNT(*) AS total_customers
FROM
`genai-experiments-072025.churn_analysis.credit_card_churn`
GROUP BY tenure_group
ORDER BY Churn_Rate_Percent DESC;

-- KPI 5: Churn by Complaint/Contact Frequency (To check if frequent bank contact signals dissatisfaction.)
-- Objective: It shows high churn in high-contact customers = service dissatisfaction.

SELECT
  Contacts_Count_12_mon,
  COUNTIF(Attrition_Flag = 'Attrited Customer') * 100.0 / COUNT(*) AS Churn_Rate_Percent,
  COUNT(*) AS total_customers
FROM
  `genai-experiments-072025.churn_analysis.credit_card_churn`
GROUP BY
  Contacts_Count_12_mon
ORDER BY
  Churn_Rate_Percent DESC;

-- KPI 6: Churn By Card Type (To check if certain card categories have higher attrition)
-- Objective: It identifies underperforming card products i.e platinum,gold etc. 

SELECT
  Card_Category,
  COUNTIF(Attrition_Flag = 'Attrited Customer') * 100.0 / COUNT(*) AS Churn_Rate_Percent,
  COUNT(*) AS total_customers
FROM
  `genai-experiments-072025.churn_analysis.credit_card_churn`
GROUP BY
  Card_Category
ORDER BY
  Churn_Rate_Percent DESC;
