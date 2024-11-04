with product_events as (
  select * 
  from {{ ref('int_product') }}
)

select product_id,
    count(distinct session_id) as total_sessions,
    count_if(has_purchase= true) as sessions_with_purchase,
    round(cast(count_if(has_purchase = true) as float) / cast(count(distinct session_id) as float), 3) as conversion_ratio_by_product
from product_events
group by product_id
order by product_id
