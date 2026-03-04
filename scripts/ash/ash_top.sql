
-- Top SQL and waits from ASH (last 30 minutes by default)
col sql_id format a13
col event  format a40
col pct    format 999.9
with ash as (
  select /*+ materialize */ *
  from v$active_session_history
  where sample_time > systimestamp - interval '30' minute
)
select sql_id,
       event,
       count(*) samples,
       100*ratio_to_report(count(*)) over() pct
from   ash
where  session_state = 'ON CPU' or wait_class <> 'Idle'
group  by sql_id, event
order  by samples desc fetch first 30 rows only;
