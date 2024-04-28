const { defineConfig } = require("cypress");

module.exports = defineConfig({
  env: {
    appName: "App prueba",
    events: 50,
    delay: 300,
    seed: 1234,
    pctClicks: 19,
    pctScroll: 17,
    pctSelectors: 16,
    pctKeys: 16,
    pctSpKeys: 16,
    pctPgNav: 16,
  },
  baseUrl: "https://consumer.huawei.com/co/",
  integration: "./cypress/integration/monkey",
  pluginsFile: "./cypress/plugins/index.js",
  pageLoadTimeout: 120000,
  defaultCommandTimeout: 120000,
  testFiles: "monkey.js",
  videosFolder: "./results",
});
