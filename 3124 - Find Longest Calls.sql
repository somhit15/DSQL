with cte as (
                  select contact_id, type,
                  sum(duration) as total_duration
                  from calls
                  group by contact_id, type
                  order by contact_id, type)

                  select
                      contact_id,
                      type,
                      total_duration,
                      concat_ws(':',
                          lpad(floor(total_duration / 3600), 2, '0'),
                          lpad(floor((total_duration % 3600) / 60), 2, '0'),
                          lpad(total_duration % 60, 2, '0')
                      ) as formatted_duration
                  from cte
                  order by contact_id, type