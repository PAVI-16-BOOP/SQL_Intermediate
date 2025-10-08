SELECT 
	cohort_year ,
	COUNT(DISTINCT(customerkey)) AS total_customers,
	SUM(total_revenue) AS total_net_revenue,
	SUM(total_revenue)/COUNT(DISTINCT(customerkey)) AS avg_customer_revenue
FROM cohort_analysis 
WHERE orderdate = first_purchase_date 
GROUP BY 
	cohort_year