FROM node:18-alpine

WORKDIR /usr/src/app

COPY app/package*.json ./
RUN npm install

COPY app/ .

# Do NOT bake secrets or runtime config into the image. Inject at runtime:
# - non-secret config: use an env-file (`--env-file .env`) or `-e VAR=value`
# - secrets: inject at runtime (do not commit), or use your platform's secret manager

CMD [ "npm", "start" ]
