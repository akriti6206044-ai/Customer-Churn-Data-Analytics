# Power BI Dashboard Build Guide

## Import
1. Open Power BI Desktop.
2. Home > Get data > Text/CSV.
3. Select the CSV dataset and choose Transform Data.
4. Check column data types. `CustomerID`, `CreditScore`, `Age`, `Tenure`, `NumOfProducts`, `HasCrCard`, `IsActiveMember`, `Exited` should be whole number; `Balance` and `EstimatedSalary` decimal; `Geography` and `Gender` text.
5. Select Close & Apply.

## Measures (Modeling > New measure)
Total Customers = DISTINCTCOUNT(bank_churn[CustomerID])

Churned Customers = CALCULATE([Total Customers], bank_churn[Exited] = 1)

Retained Customers = CALCULATE([Total Customers], bank_churn[Exited] = 0)

Churn Rate = DIVIDE([Churned Customers], [Total Customers], 0)

Retention Rate = DIVIDE([Retained Customers], [Total Customers], 0)

## Visual layout
Top row: four Card visuals — Total Customers, Churned Customers, Retained Customers, Churn Rate.
Middle: clustered column chart — Axis Geography, Values Churn Rate (format as percentage); bar chart — Axis AgeGroup (create it in Power Query or a calculated column), Values Churn Rate.
Bottom: column chart — Axis IsActiveMember, Values Churn Rate; column chart — Axis NumOfProducts, Values Churn Rate.
Add slicers for Geography and Gender.

For charts requiring a churn rate by segment, create this measure:
Segment Churn Rate = DIVIDE(CALCULATE(COUNTROWS(bank_churn), bank_churn[Exited] = 1), COUNTROWS(bank_churn), 0)

Save as `customer_churn_dashboard.pbix` in this folder. Take screenshots and put them in `images/`.
