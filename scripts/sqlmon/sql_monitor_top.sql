
-- Current & recent heavy statements from SQL Monitor
col sql_id format a13
col username format a15
col status format a18
select sql_id, status, username,
       round(elapsed_time/1e6,1) as elapsed_s,
       buffer_gets, disk_reads, px_servers_requested px_req
from   gv$sql_monitor
where  status in ('EXECUTING','DONE (ALL ROWS)','DONE (FIRST N ROWS)')
order  by elapsed_time desc fetch first 20 rows only;
