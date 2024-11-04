# For testing and development purposes only.
FROM mcr.microsoft.com/playwright:v1.48.1-noble

WORKDIR /tests
COPY . .

RUN npm ci --omit=dev || npm install --omit=dev

LABEL org.opencontainers.image.source https://github.com/juanmanuelgg/ghost

ENTRYPOINT ["node", "index.cjs"]
