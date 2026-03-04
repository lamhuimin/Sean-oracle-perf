
-- Wait-class mix from ASH (last 30 minutes)
col wait_class format a20
select wait_class, count(*) samples,
       100*ratio_to_report(count(*)) over() pct
from   v$active_session_history
where  sample_time > systimestamp - interval '30' minute
and    (session_state='ON CPU' or wait_class<>'Idle')
group  by wait_class
order  by samples desc;
