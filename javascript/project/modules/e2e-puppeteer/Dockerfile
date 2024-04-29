# Construido sobre: ghcr.io/puppeteer/puppeteer:latest
FROM node:20

RUN apt-get update \
    && apt-get install -y firefox-esr \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tests
COPY . .

RUN echo "node -v: $(node -v)"
RUN echo "npm -v: $(npm -v)"
RUN npm ci --omit=dev || npm install --omit=dev

RUN npx puppeteer browsers install firefox

RUN mkdir -p screenshots 

LABEL org.opencontainers.image.source https://github.com/juanmanuelgg/ghost

ENTRYPOINT [ "node", "--max-old-space-size=1024", "./src/index.mjs" ]
