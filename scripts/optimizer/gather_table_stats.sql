
-- Best-practice gather stats for a table (safe defaults; adjust as needed)
accept owner char prompt 'OWNER  : '
accept table char prompt 'TABLE  : '
begin
  dbms_stats.gather_table_stats(
    ownname          => upper('&owner'),
    tabname          => upper('&table'),
    cascade          => true,
    estimate_percent => dbms_stats.auto_sample_size,
    method_opt       => 'FOR ALL COLUMNS SIZE AUTO',
    granularity      => 'AUTO',
    degree           => dbms_stats.auto_degree,
    no_invalidate    => dbms_stats.auto_invalidate);
end;
/
