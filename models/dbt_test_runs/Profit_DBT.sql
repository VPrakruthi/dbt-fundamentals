Select 
    ORDER_DATE,
	CITY,
	PROFIT
from {{ source('trans_sch', 'SALES_PROFIT') }}