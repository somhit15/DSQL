
              with allfriend as (select user_id1, user_id2 from friends
              union all
              select user_id2 as user_id1, user_id1 as user_id2 from friends ),

              T as (
            select a.user_id1, b.user_id1 as user_id2 from allfriend a join allfriend b on a.user_id2=b.user_id2 and a.user_id1<b.user_id1)

            select f.user_id1, f.user_id2 from friends f where (f.user_id1, f.user_id2) not in (select T.user_id1, T.user_id2 from T)

