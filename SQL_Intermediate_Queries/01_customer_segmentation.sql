WITH customer_ltv AS (
	SELECT 
		customerkey , 
		cleaned_full_name , 
		SUM(total_revenue) AS total_ltv
	FROM 
		cohort_analysis_cleaned_names 
	GROUP BY 
		customerkey ,
		cleaned_full_name
)
,
customer_segments AS(
	SELECT 
		  PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY (total_ltv)) AS ltv_25th_percentile,
		  PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY (total_ltv)) AS ltv_75th_percentile
		FROM 
		  customer_ltv
)
,
segment_values AS(
	 SELECT  
			c.*,
			CASE 
				WHEN (c.total_ltv  <  p.ltv_25th_percentile) THEN '1 - LOW VALUE'
				WHEN ((c.total_ltv >= p.ltv_25th_percentile) AND (c.total_ltv <=  p.ltv_75th_percentile) ) THEN '2 - MID VALUE'
				ELSE '3 - HIGH VALUE'
			END AS customer_segment
	FROM 
		customer_ltv AS c
	CROSS JOIN
		customer_segments AS p
)

SELECT 
	customer_segment,
	SUM(total_ltv) AS total_ltv ,
	COUNT(customerkey) AS customer_count,
	SUM(total_ltv)  / COUNT(customerkey) AS avg_ltv
FROM segment_values
GROUP BY 
	customer_segment
ORDER  BY 
	total_ltv DESC