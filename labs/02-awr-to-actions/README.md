
# From AWR to Actions

- Generate a report for the incident window:
  ```
  @scripts/awr/list_snapshots.sql
  @scripts/awr/collect_awr.sql
  ```
- Map AWR sections → actions:
  - **Top SQL**: high CPU/elapsed → tune SQL/text, stats, access paths.
  - **IO Stats**: datafiles/objects with high reads → segment review.
  - **Instance Efficiency**: parsing, soft parse, latch waits → shared pool pressure.
