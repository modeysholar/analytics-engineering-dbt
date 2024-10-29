{%- set events = ['page_views', 'add_to_carts', 'checkouts', 'packages_shipped']%}

with event as
(
    select 
        *
    from {{ ref('stg_postgres__events')}}
),

order_items as
(
    select 
        *
    from {{ ref('stg_postgres__order_items')}} 
),

products as
(select *
from {{ ref('stg_postgres__products')}} 
),

session_timing_agg as 
(select *
from {{ ref('int_session_timing')}} 
)

select  
    e.session_id
    ,e.user_id
    ,coalesce(e.product_id, oi.product_id) as product_id
    , s.session_started_at
    , s.session_ended_at
    , datediff('minute', s.session_started_at, s.session_ended_at) as session_length_minutes

    --  {%- for event in events %}
    --     , sum(case when event_type = '{{ events }}' then 1 else 0 end) as {{ events }}
    --     {%- endfor %}
    , sum(case when event_type = 'page_views' then 1 else 0 end) as page_views
    , sum(case when event_type = 'add_to_carts' then 1 else 0 end) as add_to_carts
     , sum(case when event_type = 'checkouts' then 1 else 0 end) as checkouts
     , sum(case when event_type = 'packages_shipped' then 1 else 0 end) as packages_shipped
    
  

from event e
left join order_items oi
    on oi.order_id = e.order_id
left join session_timing_agg s
    on s.session_id = e.session_id
left join products p
    on oi.product_id = p.product_id
group by 1,2,3,4,5