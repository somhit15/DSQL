
with empworkload as (
              select e.employee_id, e.name, e.team, p.project_id, p.workload from project p left join employees e on p.employee_id = e.employee_id
            ),

            avg_team_w as (

              select *, avg(workload) over(partition by team order by team) as avgw from empworkload

            )

        
            select employee_id, project_id, name, workload from avg_team_w where workload>avgw order by employee_id