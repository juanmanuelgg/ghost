import { launch } from "puppeteer";
import GhostTest from "../ghost-test.mjs";

class UniandesExample extends GhostTest {
  constructor(hostVersion, ghostUrl, scriptName) {
    super(hostVersion, ghostUrl, scriptName);
  }

  async testedFunctionality() {
    let selector;

    const browser = await launch({
      args: ["--no-sandbox"],
      headless: true,
      timeout: 60000,
    });

    const page = await browser.newPage();
    page.setDefaultNavigationTimeout(60000);
    page.setDefaultTimeout(60000);
    await page.goto(
      "https://angular-6-registration-login-example.stackblitz.io/register"
    );

    await new Promise((r) => setTimeout(r, 7000));
    await page.screenshot({
      path: `screenshots/${this.scriptName}/${this.ghostVersion}/pagina.png`,
    });

    selector = "button";
    await page.waitForSelector(selector);
    await page.click(selector);
    await new Promise((r) => setTimeout(r, 9000));
    await page.screenshot({
      path: `screenshots/${this.scriptName}/${this.ghostVersion}/pagina2.png`,
    });
    console.log("Project loaded");

    //Interactuar con la aplicación web
    selector = "a.btn.btn-link";
    await page.waitForSelector(selector);
    await page.click(selector),
      console.log(`Clicked "cancel". URL is now ${page.url()}`);

    selector = "a.btn.btn-link";
    await page.click(selector);
    console.log(`Clicked "register". URL is now ${page.url()}`);

    selector = "button.btn.btn-primary";
    await page.click(selector);
    let feedback = await page.$$("div.invalid-feedback");

    let elems = 0;
    for (let i of feedback) {
      elems++;
    }
    await page.screenshot({
      path: `screenshots/${this.scriptName}/${this.ghostVersion}/form-feedback.png`,
    });
    console.log(
      `Clicked "Register" with an empty form. Feedback is shown in ${elems} elements`
    );

    await page.type('input[formcontrolname="firstName"]', "Monitor");
    await page.type('input[formcontrolname="lastName"]', "Pruebas");
    await page.type('input[formcontrolname="username"]', "pruebas");
    await page.type('input[formcontrolname="password"]', "MISO4208");
    selector = "button.btn.btn-primary";
    await page.click(selector);

    await new Promise((r) => setTimeout(r, 7000));
    await page.screenshot({
      path: `screenshots/${this.scriptName}/${this.ghostVersion}/success-feedback.png`,
    });

    feedback = await page.$("div.alert.alert-success");
    let text = await page.evaluate((el) => el.textContent, feedback);
    console.log(`Success dialog after creating user with message: ${text}`);

    await page.type('input[formcontrolname="username"]', "pruebas");
    await page.type('input[formcontrolname="password"]', "MISO4208");
    selector = "button.btn.btn-primary";
    await page.click(selector);
    await new Promise((r) => setTimeout(r, 7000));

    feedback = await page.$("h1");

    text = await page.evaluate((el) => el.textContent, feedback);
    await page.screenshot({
      path: `screenshots/${this.scriptName}/${this.ghostVersion}/after-login.png`,
    });
    console.log(
      `Logged in. Your user was ${
        text === "Hi Monitor!" ? "successfully" : "not"
      } created`
    );

    await browser.close();
  }
}

export { UniandesExample };
