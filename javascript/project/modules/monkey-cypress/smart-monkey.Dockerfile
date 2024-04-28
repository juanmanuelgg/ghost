FROM cypress/included:latest

WORKDIR /tests
COPY . .

RUN npm ci --omit=dev || npm install --omit=dev

ENTRYPOINT ["npm", "run", "smart-monkey""]
