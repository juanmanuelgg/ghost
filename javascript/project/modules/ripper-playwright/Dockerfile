# For testing and development purposes only.
FROM mcr.microsoft.com/playwright:v1.43.0-jammy

WORKDIR /tests
COPY . .

RUN echo "node -v: $(node -v)"
RUN echo "npm -v: $(npm -v)"
RUN npm ci --omit=dev || npm install --omit=dev

ENTRYPOINT ["node", "index.cjs"]
