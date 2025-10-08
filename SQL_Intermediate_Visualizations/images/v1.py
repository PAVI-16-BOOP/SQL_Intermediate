import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# --- Example dataframe (replace with your SQL output) ---
data = {
    "cohort_year": [2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024],
    "total_customers": [2825, 3397, 4068, 7446, 7755, 3031, 4663, 9010, 5890, 1402],
    "total_net_revenue": [14892230, 18360521, 21979733, 36460385, 36696233, 11921900, 
                          18387736, 29872808, 14979282, 2986640]
}

df = pd.DataFrame(data)

# --- Plot ---
fig, ax1 = plt.subplots(figsize=(12,6))

# Bar plot for revenue
ax1.bar(df["cohort_year"], df["total_net_revenue"], color="skyblue", alpha=0.7, label="Total Revenue")
ax1.set_xlabel("Year")
ax1.set_ylabel("Total Revenue", color="blue")
ax1.tick_params(axis="y", labelcolor="blue")

# Secondary axis for customers
ax2 = ax1.twinx()
sns.lineplot(x="cohort_year", y="total_customers", data=df, marker="o", ax=ax2, color="red", label="Customers")
sns.regplot(x="cohort_year", y="total_customers", data=df, scatter=False, ci=None, 
            line_kws={"color":"darkred", "linestyle":"--"}, ax=ax2)
ax2.set_ylabel("Total Customers", color="red")
ax2.tick_params(axis="y", labelcolor="red")

# Title and legend
fig.suptitle("Yearly Revenue (bars) and Customer Growth (line + trend)", fontsize=14)

# Combine legends from both axes
lines, labels = ax1.get_legend_handles_labels()
lines2, labels2 = ax2.get_legend_handles_labels()
ax2.legend(lines + lines2, labels + labels2, loc="upper left")

plt.tight_layout()
plt.savefig("yearly_revenue_customers.png", dpi=300, bbox_inches="tight")
print("✅ Chart saved as yearly_revenue_customers.png")
