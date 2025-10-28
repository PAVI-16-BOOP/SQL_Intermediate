-- public.cohort_analysis source

CREATE VIEW cohort_analysis
AS WITH customer_revenue AS (
         SELECT sl.customerkey,
            sl.orderdate,
            sum(sl.quantity::double precision * sl.netprice * sl.exchangerate) AS total_revenue,
            count(sl.orderkey) AS order_count,
            cs.age,
            cs.countryfull,
            cs.givenname,
            cs.surname
           FROM sales sl
             JOIN customer cs ON sl.customerkey = cs.customerkey
          GROUP BY sl.customerkey, sl.orderdate, cs.age, cs.countryfull, cs.givenname, cs.surname
        )
 SELECT customerkey,
    orderdate,
    total_revenue,
    order_count,
    age,
    countryfull,
    givenname,
    surname,
    min(orderdate) OVER (PARTITION BY customerkey) AS first_purchase_date,
    EXTRACT(year FROM min(orderdate) OVER (PARTITION BY customerkey)) AS cohort_year
   FROM customer_revenue cr;