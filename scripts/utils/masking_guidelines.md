
# Masking Guidelines
- Replace schema and object names: `HOTEL_OWNER` → `APP_SCHEMA`, `RESERVATIONS` → `T1`.
- Remove literal values (customer names, emails, phone numbers).
- For AWR/ASH/SQL Monitor, redact hostnames and service names if sensitive.
- Never commit full raw reports; copy relevant excerpts into `examples/` and scrub them first.
