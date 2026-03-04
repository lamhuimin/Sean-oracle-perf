
-- Create a SQL Plan Baseline from a good cursor in the cache
accept sqlid char prompt 'Good plan SQL_ID: '
accept phv   number prompt 'PLAN_HASH_VALUE (optional, press Enter to skip): '

declare
  l_plans_loaded pls_integer;
begin
  l_plans_loaded := dbms_spm.load_plans_from_cursor_cache(
    sql_id          => '&sqlid',
    plan_hash_value => case when '&phv' is null then null else to_number('&phv') end,
    fixed           => 'NO',
    enabled         => 'YES');
  dbms_output.put_line('Loaded plans: '||l_plans_loaded);
end;
/
