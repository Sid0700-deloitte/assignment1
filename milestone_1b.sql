{{ config(materialized='table') }}

select nav_date,fun.code as code ,fun.minimum from nav_details join
(select mutual_fund.code as code,min(nav_details.nav) as minimum from mutual_fund join
nav_details on mutual_fund.code=nav_details.code group by mutual_fund.code) fun
where nav_details.code = fun.code and nav_details.nav = fun.minimum
