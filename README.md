# Customer Churn Analysis

## Project objective
Analyze customer attributes and activity to understand patterns associated with customer exits and recommend retention actions.

## Dataset notice
`data/bank_churn_demo_synthetic.csv` is a **synthetic practice dataset created for this project template**. It is not real customer data and must not be described as real company data. If the task portal supplies a dataset, use that dataset instead and update all analysis and conclusions.

## Business questions
1. What is the overall customer churn rate?
2. Does churn vary by geography?
3. Are inactive customers more likely to leave?
4. Does churn differ by age group?
5. Does the number of products relate to churn?
6. What retention actions could address the observed segments?

## Tools
- Excel: inspect, clean, standardize, and validate the CSV.
- Python (pandas, matplotlib): EDA and charts.
- MySQL 8.0: KPI and segment queries.
- Power BI: interactive KPI dashboard.
- Optional: scikit-learn for churn prediction after EDA.

## Project structure
- `data/`: synthetic demonstration CSV.
- `sql/`: MySQL analysis queries.
- `python/`: Python EDA script.
- `powerbi/`: dashboard build checklist.
- `reports/`: report template.
- `images/`: output charts from Python.

## How to run
1. Open the CSV in Excel. Check missing values, duplicate CustomerID values, data types, and category spelling.
2. Import the CSV into MySQL Workbench as table `bank_churn`.
3. Run `sql/churn_analysis.sql`.
4. From the `python` folder, install dependencies with `pip install pandas matplotlib` and run `python churn_eda.py`.
5. Build the Power BI dashboard using the checklist in `powerbi/dashboard_guide.md`.

## Suggested dashboard
Cards: Total Customers, Churned Customers, Retained Customers, Churn Rate.
Charts: Churn by Geography, Churn by Age Group, Churn by Active Status, Churn by Number of Products.
Slicers: Geography, Gender, IsActiveMember.

## Interpretation and limitations
Associations do not prove that a factor causes churn. The synthetic data is for practicing the workflow only. Replace it with the task's official data before submitting business findings. Do not publish personal or confidential customer information.

## Portfolio deliverables
Include the cleaned dataset (if permitted), SQL file, Python code, Power BI `.pbix`, dashboard screenshots, and a concise final report. The `.pbix` must be created and saved in Power BI Desktop; this template does not fabricate one.
