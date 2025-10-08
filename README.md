# Intermediate_SQL - Sales Analysis

## Busness Questions

1. **Customer Segmentation Analysis**
2. **Cohort Analysis** - How do different revenue category customers generate revenue?
3.

## Analysis Approach

### Q1) Customer Segmentation Analysis

**ACTION_01** :
-Segmented all the customers into 3 different categories , namely = "HIGH VALUE" ,"MID VALUE", and "LOW VALUE".
-Calculated key metrics like SUM,COUNT,AVERAGE of all the 3 categories .

**Query 1** : [01_customer_segments.sql](SQL_Intermediate_Visualizations\images\01_customer_segmentation.png)

**Visualization_01** : ![01_Customer_Segmentation](/SQL_Intermediate_Visualizations/images/01_customer_segmentation.png)

**Key Findings** :
-High Value customers (25% of total customers) generate about 66% of the total revenue($135.4M
-Mid Value customers (50% of total customers) generate about 32% of the total revenue($66.6M))
-Low Value customers (25% of total customers) generate about 2% of the total revenue($4.3M)

**Buisness Insights** :

- HIGH VALUE Customers :
  -Offer premium memberships to 12,372 VIP customers as losing even one of them will significantly impact revenue
  -Encourage referrals — high-value customers often bring in similar quality leads.

\*MID VALUE Customers :
-Since they show lot of promise to go to the "HIGH VALUE Customers" category , target them with personalized product bundles, discounts, and cross-sell campaigns.
-Implement email or app-based engagement nudges to increase purchase frequency.

\*LOW VALUE Customers :
-Design price-sensitive promotions to increase purchase frequency.
-Offer low-cost subscription models or entry-level bundles to increase spend gradually
-Collect feedback — find friction points in their buying journey to improve conversion rates

### Q2) Cohort Analysis

**ACTION_02** :
-Tracked revenue and customer count per cohort
-Cohorts were grouped by year of first purchase
-Analyzed customer retention at a cohort level

**Query 2** : [02_cohort_analysis.sql](2_cohort_analysis.sql)

**Visualization_02** : ![02_Cohort Analysis](SQL_Intermediate_Visualizations\images\2_cohort_analysis.png)

**Key Findings** :
-Revenue per customer shows an alarming decreasing trend over time
-2022-2024 cohorts are consistently performing worse than the earlier cohorts
-Average revenue per customer decreases as we reach 2022 and further

**Buisness Insights** :
-value extracted from customers is decreasing over time and needs further investigation
-in 2023 and 2024 , we saw decrease in the number of customers acquired , which is concerning
-with both lowering LTV and customer acquisition , the company is facing a potential revenue decline
