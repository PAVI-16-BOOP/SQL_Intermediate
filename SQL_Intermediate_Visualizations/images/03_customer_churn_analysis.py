import pandas as pd
import matplotlib.pyplot as plt

# ====== Create the DataFrame ======
data = {
    "Year": [2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023],
    "Active": [237, 311, 385, 704, 687, 283, 442, 937, 455],
    "Churned": [2588, 3086, 3683, 6742, 7068, 2748, 4221, 8073, 4263],
    "Total": [2825, 3397, 4068, 7446, 7755, 3031, 4663, 9010, 4718],
}

df = pd.DataFrame(data)

# ====== Plot a stacked bar chart ======
plt.figure(figsize=(10, 6))
plt.bar(df["Year"], df["Active"], label="Active", color="#2ecc71")   # greenish
plt.bar(df["Year"], df["Churned"], bottom=df["Active"], label="Churned", color="#e74c3c")  # reddish

# ====== Add titles and labels ======
plt.title("Customer Status by Year (Active vs Churned)", fontsize=14, weight="bold")
plt.xlabel("Year")
plt.ylabel("Number of Customers")
plt.legend(title="Customer Status")
plt.grid(axis="y", linestyle="--", alpha=0.5)

# Show exact total labels on top of bars
for i, total in enumerate(df["Total"]):
    plt.text(df["Year"][i], total + 50, str(total), ha='center', fontsize=9, color='black')


plt.tight_layout()
plt.savefig("customer_churn_chart.png", dpi=300)


