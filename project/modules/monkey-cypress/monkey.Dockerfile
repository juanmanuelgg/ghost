FROM cypress/included:latest

WORKDIR /tests
COPY . .

RUN npm ci || npm install
RUN mv monkey-config.js cypress.config.js

LABEL org.opencontainers.image.source https://github.com/juanmanuelgg/ghost

ENTRYPOINT ["cypress", "run", "--headless", "--browser", "chrome"]
