 {{
    config(
        materialized='view'
    )
}}


with product_sessions as
(
    select * 
    from {{ ref('stg_postgres__events') }}
    where product_id is not null
),
purchase as
(
    select session_id
    from {{ ref('stg_postgres__events') }}
    where event_type = 'checkout'
)

select 
    s.session_id
    , s.product_id
    ,  case when p.session_id is not null then true
        else false end as has_purchase

from product_sessions s
full outer join purchase p
on s.session_id = p.session_id
group by s.session_id, s.product_id, p.session_id
order by s.product_id,s.session_id