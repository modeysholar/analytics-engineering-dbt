select 
count(distinct case when page_view > 0 then session_id end) as page_views,
count(distinct case when add_to_cart > 0 then session_id end) as add_to_carts,
count(distinct case when checkout > 0 then session_id end) as checkouts
from {{ ref('fact_page_views')}}