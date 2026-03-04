
# Plan Stability with SPM

1) Capture the good plan from cache:
   ```
   @scripts/optimizer/display_cursor.sql
   @scripts/optimizer/create_plan_baseline_from_cursor.sql
   ```
2) Validate with `DBMS_XPLAN` and controlled test.
3) Monitor with `sql_monitor_top.sql` during rollout.
