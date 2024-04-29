FROM cypress/included:latest

WORKDIR /tests
COPY . .

RUN echo "node -v: $(node -v)"
RUN echo "npm -v: $(npm -v)"
RUN npm ci -|| npm install
RUN mv smart-monkey-config.js cypress.config.js

LABEL org.opencontainers.image.source https://github.com/juanmanuelgg/ghost

ENTRYPOINT ["cypress", "run", "--headless", "--browser", "chrome"]
