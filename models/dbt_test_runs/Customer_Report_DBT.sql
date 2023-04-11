select
	LOCATION,
	CUSTOMER_ID,
	TOTAL_AMT
    from (select 
      city as Location,
      cs.id as customer_id,
      sum(PURCHASE_AMT) as Total_Amt,
      rank() over (partition by city order by total_amt desc) as rn
  from {{ source('Stg_sch', 'STG_ORDERS') }} ord, {{ source('Raw_sch', 'customers') }} cs
      where ord.customer_id = cs.id
      {{ dbt_utils.group_by(n=3) }}
      qualify rn = 1
      order by Total_amt desc, cs.id)