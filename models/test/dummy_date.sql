{{
    config(
        materialized='table'
    )
}}

SELECT CURRENT_DATE() AS DATE_COL