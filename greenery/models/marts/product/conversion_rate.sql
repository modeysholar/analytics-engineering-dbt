
select 
    count(session_id) as total_sessions,
    count_if(checkouts >= 1) as sessions_with_purchase,
    round(cast(count_if(checkouts >= 1) as float) / cast(count(distinct session_id) as float), 3) as conversion_ratio

 from {{ ref('int_sessions') }}