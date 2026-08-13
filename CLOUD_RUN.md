# Cloud Run mapping for environment and secrets

Configuration (non-secrets): map to `--set-env-vars`

- DATABASE_URL: `--set-env-vars DATABASE_URL=<value>`
- LOG_LEVEL: `--set-env-vars LOG_LEVEL=<value>`
- PORT: `--set-env-vars PORT=<value>` (Cloud Run sets `PORT` automatically for the container runtime; prefer using the service's port binding)

Secrets: store in Secret Manager and map with `--set-secrets`

- API_KEY: create secret in Secret Manager, then deploy/run with:

  --set-secrets API_KEY=projects/PROJECT_ID/secrets/API_KEY:latest

Notes:
- Do not bake secrets into the image or into source control. Use Secret Manager for production and runtime injection for local testing.
- For local development use an `.env` (git-ignored) and `--env-file .env` when running `docker run`.