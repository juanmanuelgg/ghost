// # Construido sobre: https://nodemailer.com/#example
import { createTransport } from "nodemailer";
import "dotenv/config";

const transporter = createTransport({
  host: "smtpout.secureserver.net", // Este valor se asigna porque nuestro servidor de correo es de GoDaddy
  port: 465,
  secure: true, // Use `true` for port 465, `false` for all other ports
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASS,
  },
});

// async..await is not allowed in global scope, must use a wrapper
async function main() {
  // send mail with defined transport object
  const info = await transporter.sendMail({
    from: `"${process.env.NAME_USER}" <${process.env.EMAIL_USER}>`, // sender address
    to: `${process.env.EMAIL_RECEIVERS}`, // list of receivers
    subject: "Sirve nodemailer ✔", // Subject line
    text: "¡Hola Mundo!", // plain text body
    html: "<b>¡Hola Mundo!</b>", // html body
  });

  console.log("Message sent: %s", info.messageId);
  // Sera similar a:
  // Message sent: <d786aa62-4e0a-070a-47ed-0b0666549519@ethereal.email>
}

main().catch(console.error);
