FROM cypress/included:latest

WORKDIR /tests
COPY . .
RUN mkdir -p cypress/screenshots && mkdir -p cypress/videos && mkdir -p cypress/reports

RUN npm ci --omit=dev || npm install --omit=dev

LABEL org.opencontainers.image.source https://github.com/juanmanuelgg/ghost

ENTRYPOINT ["cypress", "run", "--headless", "--browser", "chrome", "--spec", "cypress/e2e/ghost/"]
