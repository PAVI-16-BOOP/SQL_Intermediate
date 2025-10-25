-- public.daily_revenue source

CREATE  VIEW public.daily_revenue
AS SELECT orderdate,
    sum(quantity:: double precision * netprice * exchangerate) AS total_revenue
   FROM sales sl
   GROUP BY orderdate;