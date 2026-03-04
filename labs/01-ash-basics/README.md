
# ASH Basics

1) Identify top waits and SQL in last 30 minutes
   ```
   @scripts/ash/ash_top.sql
   @scripts/ash/ash_waits_by_sql.sql
   ```
2) Turn observations into actions:
   - CPU dominating → inspect `top_sql_cpu_elapsed.sql` and execution stats
   - I/O dominating → check `top_segments_io.sql`, access paths, indexes
