FROM cypress/included:latest

WORKDIR /tests
COPY . .

RUN echo "node -v: $(node -v)"
RUN echo "npm -v: $(npm -v)"
RUN npm ci -|| npm install
RUN mv smart-monkey-config.js cypress.config.js

ENTRYPOINT ["cypress", "run", "--headless", "--browser", "chrome"]
