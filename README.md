
# Database Performance Toolkit

## The first 60–90 minutes of an Oracle performance investigation, as runnable scripts: ASH/AWR triage, SQL Monitor, wait and segment analysis, plan stability.

## Why this repo?
I work primarily on Oracle Database performance (focus: wait analysis, SQL tuning, plan stability).
This repo shares the “first 60–90 minutes” toolkit I use to go from symptoms to actions.

> ⚠️ Licensing: Features like **AWR/ASH/SQL Monitor** belong to Oracle **Diagnostics Pack** / **Tuning Pack**.
> Ensure your usage complies with your organization’s licenses. If you don’t have Diagnostics Pack, use **Statspack**.

## What’s inside
- **ASH triage**: Top SQL, top waits, wait breakdown by session and SQL.
- **AWR slices**: Snapshot listing and text report export.
- **SQL Monitor**: Find currently/ recently heavy SQL; generate reports.
- **Wait & segment analysis**: Wait class breakdown, latch/mutex hotspots, top I/O segments.
- **Optimizer stability**: Display cursor & predicates, gather stats best practices, create plan baselines.

## Prerequisites
- SQL*Plus or SQLcl
- DBA privileges (read access to V$/GV$/DBA_HIST as applicable)
- If using AWR/ASH/SQL Monitor, ensure appropriate licensing.

## Quick start
```bash
# 1) Format SQL*Plus output
sqlplus / as sysdba @scripts/utils/set_env_plus.sql

# 2) List recent snapshots, note SNAP_IDs
@scripts/awr/list_snapshots.sql

# 3) Generate an AWR text report for a window (BEGIN_SNAP, END_SNAP)
@scripts/awr/collect_awr.sql

# 4) Triage hot SQL using ASH & SQL Monitor
@scripts/ash/ash_top.sql
@scripts/sqlmon/sql_monitor_top.sql

# 5) Break down waits and I/O
@scripts/diagnostics/wait_class_breakdown.sql
@scripts/diagnostics/top_segments_io.sql

# 6) Stabilize a good plan (if needed)
@scripts/optimizer/display_cursor.sql
@scripts/optimizer/create_plan_baseline_from_cursor.sql
```

## Safe data handling
- **Never commit** real AWR/ASH/SQL Monitor reports or customer object names.
- Use `examples/` for anonymized output and **mask sensitive names** (see `scripts/utils/masking_guidelines.md`).

## Mapping to actions
- **CPU bound**: Check `top_sql_cpu_elapsed.sql`, inspect PL/SQL and SQL_FULLTEXT, consider appropriate stats, indexes, or parallelism.
- **I/O bound**: Use `top_segments_io.sql`, segment advisory, and SQL access paths.
- **Latching/mutex**: Start with `latch_mutex_hotspots.sql`, review shared pool pressure, cursor parsing, and hot blocks.
- **Plan instability**: `display_cursor.sql` & `create_plan_baseline_from_cursor.sql`; verify bind peeking, histograms, and stats.

## Labs
- **01-ash-basics**: Read ASH quickly (top waits, top sql_id).
- **02-awr-to-actions**: From AWR report sections → actionable steps.
- **03-plan-stability**: Baselines, stats, and verifying with `DBMS_XPLAN`.

## Contribution & Issues
PRs for new scripts and corrections are welcome. Open an Issue with:
environment, Oracle version/edition, and sample output (masked).
