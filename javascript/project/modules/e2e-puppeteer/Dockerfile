# For testing and development purposes only.
FROM node:20-bookworm-slim

WORKDIR /test
COPY . .

RUN npm ci --omit=dev || npm install --omit=dev

ENTRYPOINT [ "node", "./src/index.mjs" ]
