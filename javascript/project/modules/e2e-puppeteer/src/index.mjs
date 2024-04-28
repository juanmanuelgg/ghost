import { UniandesExample } from "./ghost/uniandes-example.mjs";

/**
 * Ejecutor de la suite de pruebas
 * @param {*} ghostVersion La versión de ghost a probar
 * @param {*} ghostUrl El protocolo, host y puerto por el que se esta exponiendo ghost
 * @param {*} scriptName El nombre del script a ejecutar
 */
async function main(ghostVersion, ghostUrl, scriptName) {
  const uniandesExample = new UniandesExample(
    ghostVersion,
    ghostUrl,
    scriptName,
  );
  await uniandesExample.createDir();
  await uniandesExample.testedFunctionality();
}

const ghostVersion = process.argv[2] || "latest";
const ghostUrl = process.argv[3] || "http://localhost:8080";
const scriptName = process.argv[4] || "uniandes-example.mjs";

main(ghostVersion, ghostUrl, scriptName);
