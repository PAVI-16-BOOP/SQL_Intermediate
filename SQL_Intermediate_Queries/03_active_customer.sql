-- classify customers as either active or churned (from APRIL 20th 2024)

WITH actives AS (	
SELECT  
		customerkey , 
		orderdate,
		cleaned_full_name,
		first_purchase_date,
		cohort_year,
		ROW_NUMBER() OVER(PARTITION BY(customerkey) ORDER BY (orderdate) DESC) AS rn
	FROM 
		cohort_analysis_cleaned_names 
)
,
churned_customers AS (
SELECT
	customerkey,
	cleaned_full_name,
	first_purchase_date,
	orderdate AS last_purchase_date,
	CASE
		WHEN orderdate < (SELECT MAX(orderdate) FROM sales) - INTERVAL '6 months' THEN 'Churned'
		ELSE 'Active'
	END AS customer_status,
	cohort_year
FROM
	actives
WHERE
	rn = 1
)
,
status_counts AS (
  SELECT
	cohort_year,
	customer_status,
	COUNT(customerkey) AS num_customer
  FROM churned_customers
  GROUP BY cohort_year, customer_status
)

SELECT
  cohort_year,
  customer_status,
  num_customer,
  SUM(num_customer) OVER (PARTITION BY cohort_year) AS total_customers,
  ROUND(CAST(num_customer AS numeric) / SUM(num_customer) OVER (PARTITION BY cohort_year), 2) AS status_percentage
FROM status_counts
ORDER BY cohort_year, customer_status;