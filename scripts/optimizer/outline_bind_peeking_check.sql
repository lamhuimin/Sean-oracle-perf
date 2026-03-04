
-- Quick peek at bind peeking/histograms situations for a SQL_ID
accept sqlid char prompt 'SQL_ID: '
select sql_id, child_number, is_bind_sensitive, is_bind_aware, is_reoptimizable
from   v$sql
where  sql_id='&sqlid'
order  by child_number;

-- Set TABLE_NAME before running the second query as needed
-- define TABLE_NAME='YOUR_TABLE'
select column_name, histogram, num_buckets
from   user_tab_histograms
where  table_name = upper('&TABLE_NAME')
order  by column_name;
