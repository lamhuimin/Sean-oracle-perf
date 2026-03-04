
col sql_id format a13
col wait_class format a20
select sql_id, wait_class, count(*) samples,
       100*ratio_to_report(count(*)) over(partition by sql_id) pct_in_sql
from   v$active_session_history
where  sample_time > systimestamp - interval '30' minute
and    (session_state='ON CPU' or wait_class<>'Idle')
group  by sql_id, wait_class
order  by sql_id, samples desc;
