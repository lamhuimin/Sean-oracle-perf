
-- Look for hot latches/mutexes (system-level)
col name format a40
select name, gets, misses, immediate_gets, immediate_misses
from   v$latch
where  misses > 0
order  by misses desc fetch first 20 rows only;

col location format a60
select namespace, get_misses, sleep_count, location
from   v$mutex_sleep_history
order  by sleep_count desc fetch first 20 rows only;
