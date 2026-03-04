
set echo off feedback off timing on define on verify off
set lines 300 pages 500 trims on trimspool on long 1000000 longchunksize 100000
column inst_name new_value INST noprint
select instance_name ||'@'||host_name inst_name from v$instance;
prompt Connected: &INST
