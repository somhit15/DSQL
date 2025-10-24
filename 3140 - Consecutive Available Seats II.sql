 with cte as (
                      select seat_id, free, seat_id-row_number() over(order by seat_id) as gid from cinema where free = 1
                    ),

                    cte2 as (
                      select min(seat_id) as from_seat, max(seat_id) as to_seat, count(gid) as freeseat, rank() over(order by count(gid) desc) as rnk from cte group by gid
                    )


                      select from_seat, to_seat, freeseat from cte2 where rnk = 1
