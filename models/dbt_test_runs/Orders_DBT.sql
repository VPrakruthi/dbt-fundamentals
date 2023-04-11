Select
	ORDER_YEAR,
	LOCATION,
	TOTAL_AMT
from(
select order_year as Order_Year,city as Location,sum(PURCHASE_AMT) as Total_Amt
from  {{ source('Stg_sch', 'STG_ORDERS') }} ord, {{ source('Raw_sch', 'customers') }} cs
where ord.customer_id = cs.id
{{ dbt_utils.group_by(n=2) }}
order by order_year)