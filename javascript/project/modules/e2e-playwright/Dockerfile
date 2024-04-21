# For testing and development purposes only.
FROM mcr.microsoft.com/playwright:v1.43.0-jammy

# user 'pwuser' already exists in the base image
USER pwuser
WORKDIR /tests
RUN chown pwuser:pwuser /tests
COPY --chown=pwuser:pwuser . .

RUN npm ci --omit=dev || npm install --omit=dev

ENTRYPOINT [ "npm", "test" ]