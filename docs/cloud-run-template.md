# Cloud Run Mapping

Configuration Variables

- `DATABASE_URL` : non-secret config (DB connection string). Map with `--set-env-vars DATABASE_URL=<value>` for non-secret parts, or store credentials in Secret Manager.

- `LOG_LEVEL` : non-secret (e.g., debug, info, warn, error). Map with `--set-env-vars LOG_LEVEL=info`.

- `PORT` : container port (Cloud Run will set `PORT` automatically in the runtime environment; still document it).

Secrets

- `API_KEY` : secret — store in Secret Manager and map with `--set-secrets API_KEY=projects/PROJECT_ID/secrets/API_KEY:latest`.

- Database credentials (if not part of a single connection string) : store in Secret Manager and reference similarly.

Notes

- Use `--set-env-vars` for non-sensitive config and `--set-secrets` for secrets backed by Secret Manager.
- For local testing, use a git-ignored `.env` and `docker run --env-file .env` or `--env-file` in your local docker-compose.