import { promises as fsPromises } from "fs";

export default class GhostTest {
  constructor(hostVersion, ghostUrl, scriptName) {
    this.ghostVersion = hostVersion;
    this.ghostUrl = ghostUrl;
    this.scriptName = scriptName;
  }

  async createDir() {
    const dir0 = `screenshots/`;
    try {
      await fsPromises.access(dir0);
    } catch (e) {
      await fsPromises.mkdir(dir0);
    }

    const dir1 = `screenshots/${this.scriptName}/`;
    try {
      await fsPromises.access(dir1);
    } catch (e) {
      await fsPromises.mkdir(dir1);
    }

    const dir2 = `screenshots/${this.scriptName}/${this.ghostVersion}/`;
    try {
      await fsPromises.access(dir2);
    } catch (e) {
      await fsPromises.mkdir(dir2);
    }
  }

  async testedFunctionality() {
    console.info("Implementar metodo abstracto.");
  }
}
