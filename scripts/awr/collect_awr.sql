
-- Generates AWR text for a chosen snapshot range.
-- Requires Diagnostics Pack + appropriate grants.
set serveroutput on size unlimited
set pages 0 long 1000000 longchunksize 100000 lines 200 trimspool on

var dbid number; var inst number; var bid number; var eid number; var rpt clob;

begin
  select dbid into :dbid from v$database;
  select instance_number into :inst from v$instance;
end;
/

prompt Enter BEGIN SNAP_ID:
accept b number
prompt Enter END SNAP_ID:
accept e number

begin
  :bid := &b; :eid := &e;
  :rpt := dbms_workload_repository.awr_report_text(:dbid, :inst, :bid, :eid);
end;
/

spool awr_&&b._&&e..txt
print :rpt
spool off
prompt AWR written to awr_&&b._&&e..txt
