# Intermediate_SQL - Sales Analysis

## Overview

This analysis explores customer behavior and revenue trends through segmentation, cohort performance, and churn dynamics to identify growth and retention opportunities fo an e-commerce company.

## Busness Questions

1. **Customer Segmentation Analysis**
2. **Cohort Analysis** - How do different revenue category customers generate revenue?
3. **Active and Churned Customers** - How do the "Active" and "Churned" rates vary per cohort year ?

## Analysis Approach

### Q1) Customer Segmentation Analysis

**Action_01** :
-Segmented all the customers into 3 different categories , namely = "HIGH VALUE" ,"MID VALUE", and "LOW VALUE".
-Calculated key metrics like SUM,COUNT,AVERAGE of all the 3 categories .

**Query 1** :  [01_customer_segmentation.sql](SQL_Intermediate_Queries/01_customer_segmentation.sql)  

**Visualization_01** : ![01_Customer_Segmentation](/SQL_Intermediate_Visualizations/images/01_customer_segmentation.png)

**Key Findings** :
-High Value customers (25% of total customers) generate about 66% of the total revenue($135.4M)
-Mid Value customers (50% of total customers) generate about 32% of the total revenue($66.6M)
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

**Action_02** :
-Tracked revenue and customer count per cohort
-Cohorts were grouped by year of first purchase
-Analyzed customer retention at a cohort level

**Query 2** : [02_cohort_analysis.sql](/SQL_Intermediate_Queries/02_cohort_analysis.sql)

**Visualization_02** : ![Cohort Analysis](/SQL_Intermediate_Visualizations/images/02_cohort_analysis.png)  

**Key Findings** :
-Revenue per customer shows an alarming decreasing trend over time
-2022-2024 cohorts are consistently performing worse than the earlier cohorts
-Average revenue per customer decreases as we reach 2022 and further

**Buisness Insights** :
-value extracted from customers is decreasing over time and needs further investigation
-in 2023 and 2024 , we saw decrease in the number of customers acquired , which is concerning
-with both lowering LTV and customer acquisition , the company is facing a potential revenue decline


### Q3) Active and Churned Customers

**Action_03** : 
- got the list of all customers and their latest orders 
- classified them as : 

i-  active (customers who have had a purchase in the last 6 months and atleast 1 purchase beyond 6 months ago)

ii-  churned (customers who have not had a purchase in the last 6 months and atleast 1 purchase beyond 6 months ago or customers who have had a purchase in the last 6 months and no purchases beyond 6 months ago)
- calculated the number and percentage of active and churned customers cohort year wise

**Query 3** : [03_active_customer.sql](/SQL_Intermediate_Queries/03_active_customer.sql)

**Visualization_03** : ![Customer Churn](/SQL_Intermediate_Visualizations/images/03_customer_churn_chart.png)


**Key Findings** : 

- Churn rate has consistently remained high (~90%) across all years.
The proportion of churned customers (red section) dominates each bar, showing that only around 8–10% of customers remain active annually.

- Customer base size grew steadily until 2022.
Total customers increased sharply from ~2.8K in 2015 to ~9K in 2022, meaning the company successfully attracted new customers year over year.

- Despite growth, retention did not improve.
Even as total customers increased, the active portion didn’t scale up proportionally—indicating weak long-term engagement or loyalty strategies.

- Slight retention improvement in 2022–2023.
The active percentage ticks up from about 9% to 10%, showing a minor positive shift—possibly early effects of retention measures or targeted campaigns.

- Post-2022 dip in total customers (2023)
There’s a visible drop in total customers from 9,010 to 4,718, suggesting possible churn spillover or decreased acquisition, which should be investigated.


**Buisness Insights** :

- Shift focus from acquiring new customers to keeping existing ones through personalization, feedback loops, and loyalty incentives
- Identify high-value active customers (frequent buyers, large spenders).

Identify at-risk customers (inactive for X days, reduced spending).
Then design personalized re-engagement campaigns (discounts, reminders, recommendations).
- strengthen early engagement strategies to target teh first 1-2 years with on boarding incentives ,etc.

## Strategic Recommendations


1) **Focus on Customer Retention**
The company should shift more attention from just acquiring new customers to keeping the existing ones. Building long-term relationships with loyal buyers can create stable revenue growth. Introducing loyalty programs, cashback offers, or personalized discounts can encourage repeat purchases. Regular engagement through emails, app notifications, or personalized messages will also help maintain consistent customer interaction.

2) **Strengthen High-Value Relationships**
High-value customers bring in a major portion of the company’s revenue, so retaining them is crucial. Offering exclusive perks like early access to new products, dedicated support, or premium memberships can make them feel valued. Since satisfied high-value customers often refer others, introducing a referral program could help attract more similar customers organically.

3) **Engage New Customers Early**
The first few months after a customer joins are key to shaping their loyalty. A strong onboarding process — welcome offers, discounts on the first few purchases, or guided product recommendations — can help build early engagement. Tracking their activity during this period also helps identify potential churn risks early and re-engage them before they drop off.

4) **Boost Mid and Low Value Segments**
Mid-value customers have good potential to become high-value ones with the right strategies. Personalized product bundles, combo offers, or targeted campaigns can encourage them to spend more. For low-value customers, focusing on affordability is essential — small bundle discounts, entry-level subscriptions, and feedback surveys can help understand and improve their buying experience over time.

5) **Adopt a Data-Driven Retention Strategy**
Regularly monitoring customer data will help the company take timely action. Dashboards tracking churn rates, repeat purchase frequency, and lifetime value can highlight problem areas. Gathering and analyzing feedback will also reveal what customers like or dislike about their experience. Using this data, the company can predict which customers are at risk of leaving and take proactive steps to win them back through personalized offers or communication.

## Technical Details 

- **Databases**: PostgreSQL
- **Analysis Tools** : PostgreSQL
- **Visualization** : ChatGPT