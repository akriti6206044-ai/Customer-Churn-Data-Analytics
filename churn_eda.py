# Customer Churn Analysis - Python EDA
# Uses a synthetic practice dataset. Replace the CSV with your approved task dataset
# before presenting findings as real business results.
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("../data/bank_churn_demo_synthetic.csv")

print("Shape:", df.shape)
print(df.head())
print(df.info())
print("\nMissing values:\n", df.isna().sum())
print("\nDuplicates:", df.duplicated(subset=["CustomerID"]).sum())

# Basic quality checks
df = df.drop_duplicates(subset=["CustomerID"])
df["Geography"] = df["Geography"].astype("string").str.strip().str.title()

# KPI calculations
total = len(df)
churned = int(df["Exited"].sum())
retained = total - churned
churn_rate = churned / total * 100
print(f"\nTotal customers: {total}")
print(f"Churned: {churned}; Retained: {retained}")
print(f"Churn rate: {churn_rate:.2f}%")

# Segment analysis
for col in ["Geography", "IsActiveMember", "NumOfProducts"]:
    print(f"\nChurn rate by {col}:")
    print((df.groupby(col)["Exited"].mean()*100).round(2))

# Visualizations (save into images folder)
(df.groupby("Geography")["Exited"].mean()*100).plot(kind="bar", title="Churn Rate by Geography")
plt.ylabel("Churn rate (%)"); plt.tight_layout()
plt.savefig("../images/churn_by_geography.png"); plt.close()

(df.groupby("IsActiveMember")["Exited"].mean()*100).plot(kind="bar", title="Churn Rate by Active Status")
plt.ylabel("Churn rate (%)"); plt.tight_layout()
plt.savefig("../images/churn_by_activity.png"); plt.close()

(df.groupby("NumOfProducts")["Exited"].mean()*100).plot(kind="bar", title="Churn Rate by Number of Products")
plt.ylabel("Churn rate (%)"); plt.tight_layout()
plt.savefig("../images/churn_by_products.png"); plt.close()

df["AgeGroup"] = pd.cut(df["Age"], bins=[17,29,39,49,59,100],
                        labels=["18-29","30-39","40-49","50-59","60+"])
(df.groupby("AgeGroup", observed=False)["Exited"].mean()*100).plot(kind="bar", title="Churn Rate by Age Group")
plt.ylabel("Churn rate (%)"); plt.tight_layout()
plt.savefig("../images/churn_by_age.png"); plt.close()

print("\nCharts saved in ../images/")
