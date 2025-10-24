with td as (select *,
                lead(status_time) over(partition by server_id order by server_id) as ptime
               from servers)
               
                select sum(hours) from (
               select *, TIMESTAMPDIFF(Second, status_time, ptime)/3600 as hours from td where session_status = 'start'
               )
