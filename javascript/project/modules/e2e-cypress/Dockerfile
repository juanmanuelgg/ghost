FROM cypress/included:latest

WORKDIR /tests
COPY . .

RUN npm ci || npm install
RUN mkdir -p cypress/screenshots && mkdir -p cypress/videos && mkdir -p cypress/reports

ENTRYPOINT ["cypress", "run", "--headless", "--browser", "chrome", "--spec", "cypress/e2e/ghost/*.cy.js"]
