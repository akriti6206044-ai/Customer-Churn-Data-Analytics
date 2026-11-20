-- Customer Churn Analysis | MySQL 8.0
-- Dataset: bank_churn_demo_synthetic.csv (synthetic practice data)
-- Import CSV into a table named bank_churn.

-- 1. Overall churn rate
SELECT COUNT(*) AS total_customers,
       SUM(Exited) AS churned_customers,
       ROUND(100.0 * SUM(Exited) / COUNT(*), 2) AS churn_rate_pct
FROM bank_churn;

-- 2. Churn by geography
SELECT Geography, COUNT(*) AS customers,
       SUM(Exited) AS churned,
       ROUND(100.0 * SUM(Exited)/COUNT(*),2) AS churn_rate_pct
FROM bank_churn
GROUP BY Geography ORDER BY churn_rate_pct DESC;

-- 3. Churn by active status
SELECT IsActiveMember, COUNT(*) AS customers,
       SUM(Exited) AS churned,
       ROUND(100.0 * SUM(Exited)/COUNT(*),2) AS churn_rate_pct
FROM bank_churn GROUP BY IsActiveMember;

-- 4. Churn by age group
SELECT CASE
         WHEN Age < 30 THEN '18-29'
         WHEN Age < 40 THEN '30-39'
         WHEN Age < 50 THEN '40-49'
         WHEN Age < 60 THEN '50-59'
         ELSE '60+'
       END AS age_group,
       COUNT(*) AS customers, SUM(Exited) AS churned,
       ROUND(100.0 * SUM(Exited)/COUNT(*),2) AS churn_rate_pct
FROM bank_churn GROUP BY age_group ORDER BY age_group;

-- 5. Churn by number of products
SELECT NumOfProducts, COUNT(*) AS customers,
       SUM(Exited) AS churned,
       ROUND(100.0 * SUM(Exited)/COUNT(*),2) AS churn_rate_pct
FROM bank_churn GROUP BY NumOfProducts ORDER BY NumOfProducts;

-- 6. Churn by credit card ownership
SELECT HasCrCard, COUNT(*) AS customers,
       SUM(Exited) AS churned,
       ROUND(100.0 * SUM(Exited)/COUNT(*),2) AS churn_rate_pct
FROM bank_churn GROUP BY HasCrCard;

-- 7. Average balance: churned vs retained
SELECT Exited, COUNT(*) AS customers,
       ROUND(AVG(Balance),2) AS avg_balance,
       ROUND(AVG(Age),1) AS avg_age,
       ROUND(AVG(CreditScore),1) AS avg_credit_score
FROM bank_churn GROUP BY Exited;

-- 8. High-risk customer segment (descriptive, not a prediction)
SELECT CustomerID, Geography, Age, NumOfProducts, IsActiveMember, Balance
FROM bank_churn
WHERE IsActiveMember = 0 AND (Age >= 45 OR NumOfProducts = 1)
ORDER BY Age DESC LIMIT 100;
