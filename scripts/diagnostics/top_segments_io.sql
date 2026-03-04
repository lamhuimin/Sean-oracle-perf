
-- Top physical reads/writes by segment (v$segment_statistics)
col owner format a20
col object_name format a30
select owner, object_name, statistic_name, value
from (
  select owner, object_name, statistic_name, value,
         row_number() over (partition by statistic_name order by value desc) rn
  from   v$segment_statistics
  where  statistic_name in ('physical reads','physical writes')
)
where rn <= 20
order by statistic_name, value desc;
