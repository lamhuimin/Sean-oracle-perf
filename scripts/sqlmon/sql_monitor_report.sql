
-- Creates a text SQL Monitor report for a given SQL_ID and SID/SERIAL#/KEY
set long 1000000 longchunksize 100000 lines 300 pages 0 trimspool on
accept sid   prompt 'SID          : '
accept serial prompt 'SERIAL#      : '
accept key   prompt 'SQL_EXEC_ID  : '  -- from gv$sql_monitor.sql_exec_id
accept sqlid prompt 'SQL_ID       : '
var rpt clob
begin
  :rpt := dbms_sqltune.report_sql_monitor(
            sql_id => '&sqlid',
            sql_exec_id => to_number('&key'),
            report_level => 'ALL',
            type => 'TEXT');
end;
/
spool sqlmon_&sqlid._&key..txt
print :rpt
spool off
