FROM cypress/included:latest

WORKDIR /tests
COPY . .
RUN mkdir -p cypress/screenshots && mkdir -p cypress/videos && mkdir -p cypress/reports

RUN echo "node -v: $(node -v)"
RUN echo "npm -v: $(npm -v)"
RUN npm ci --omit=dev || npm install --omit=dev

ENTRYPOINT ["cypress", "run", "--headless", "--browser", "chrome", "--spec", "cypress/e2e/ghost/"]
