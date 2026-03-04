
col begin_interval_time format a30
col end_interval_time   format a30
select snap_id, begin_interval_time, end_interval_time, flush_elapsed
from   dba_hist_snapshot
order  by snap_id desc fetch first 40 rows only;
