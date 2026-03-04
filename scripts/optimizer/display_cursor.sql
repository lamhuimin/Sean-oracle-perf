
-- Show the last plan for a SQL_ID (includes predicates and outline)
set lines 300 pages 100
accept sqlid char prompt 'SQL_ID: '
select * from table(dbms_xplan.display_cursor('&sqlid', null, 'ALLSTATS LAST +PEEKED_BINDS +OUTLINE'));
