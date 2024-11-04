with events as (
    select
    * 
    from {{ ref('stg_postgres__events') }} 
)


select
    session_id
    ,sum (case when events.event_type='page_view' then 1 else 0 end) as page_views
    ,sum (case when events.event_type='add_to_cart' then 1 else 0 end) as add_to_carts
    ,sum (case when events.event_type='checkout' then 1 else 0 end) as checkouts
    ,sum (case when events.event_type='package_shipped' then 1 else 0 end) as packages_shipped
    

from events
group by session_id