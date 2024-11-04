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

{% set event_types = dbt_utils.get_column_values(
    table=ref('stg_postgres__events'), 
    column='event_type') %}

select  
    e.session_id
    ,e.user_id
    ,coalesce(e.product_id, oi.product_id) as product_id
    , s.session_started_at
    , s.session_ended_at
    , datediff('minute', s.session_started_at, s.session_ended_at) as session_length_minutes

     {%- for event_type in event_types %}
        , {{sum_of('e.event_type', event_type)}} as {{ event_type }}
        {%- endfor %}
    

from event e
left join order_items oi
    on oi.order_id = e.order_id
left join session_timing_agg s
    on s.session_id = e.session_id
left join products p
    on oi.product_id = p.product_id
group by 1,2,3,4,5