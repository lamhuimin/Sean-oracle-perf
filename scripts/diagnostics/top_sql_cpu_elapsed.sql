
-- Top SQL by CPU and elapsed (cursor cache)
col sql_id format a13
col module format a18
select *
from (
  select sql_id,
         round(cpu_time/1e6,1) cpu_s,
         round(elapsed_time/1e6,1) ela_s,
         executions,
         round(buffer_gets/greatest(executions,1)) gets_per_exec,
         module
  from   v$sql
  where  parsing_schema_name not in ('SYS','SYSTEM')
  order  by cpu_time desc
) where rownum <= 30;
