# For testing and development purposes only.
FROM mcr.microsoft.com/playwright:v1.43.0-jammy

WORKDIR /tests
COPY . .

RUN npm ci --omit=dev || npm install --omit=dev

LABEL org.opencontainers.image.source https://github.com/juanmanuelgg/ghost

ENTRYPOINT [ "npx", "playwright", "test", "e2e/ghost/", "--project", "firefox" ]
