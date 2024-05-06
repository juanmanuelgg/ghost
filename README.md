# Ghost

## Prender/Apagar Ghost localmente usando Docker

```bash
cd ./docker
# Inicializar Ghost
docker compose up -d --build

# Parar Ghost
docker compose down

# Parar Ghost, eliminar contenedores y volúmenes
docker compose down -v --rmi all
```

### Configurar Ghost

Ghost requiere un usuario de correo para poder enviar los token de autenticación, por lo que se debe configurar el archivo `./docker/config.production.json` con las credenciales de un servidor SMTP. En nuestro despliegue asistido por docker-compose se va a:

- 1. Descomentar un volumen dentro del servicio ghost en el arcvhivo `./docker/docker-compose.yml`

  ```yaml
  # Linea 27
  - ./config.production.json:/var/lib/ghost/config.production.json
  ```

- 2. Configurar el archivo de configuración de Ghost

  > vim ./docker/config.production.json

  ```json
  {
    "url": "http://localhost:2368",
    "server": {
      "port": 2368,
      "host": "::"
    },
    "mail": {
      "transport": "SMTP",
      "options": {
        "host": "smtpout.secureserver.net",
        "port": 465,
        "secure": true,
        "from": "'Robot Automatizacion' <automatizacion@appbajopruebas.com>",
        "auth": {
          "user": "automatizacion@appbajopruebas.com",
          "pass": "XXXX_ESTE_SECRETO_DEBE_SER_REEMPLAZADO_XXXX"
        }
      }
    },
    "logging": {
      "transports": ["file", "stdout"]
    },
    "process": "systemd",
    "paths": {
      "contentPath": "/var/lib/ghost/content"
    }
  }
  ```

## Desplegar Ghost en servidor

### Preparar 2 pajejas de llaves para el usuario administrador y el usuario de ghost

Dentro de la carpeta `./terraform/secure` se ejecuto los siguiente comandos:

```bash
# Crear llaves para el usuario administrador usando ecdsa
ssh-keygen -t ecdsa -b 521 -C "Llave administrador" -f ./id_ecdsa_administrador

# Crear llaves para el usuario de ghost usando ecdsa
ssh-keygen -t ecdsa -b 521 -C "Llave ghost" -f ./id_ecdsa_ghost
```

Pegar estas llaves en el archivo `./terraform/cloud-init.yml` en las variables `ssh_authorized_keys`.

### Levantar infraestructura en Digital Ocean

```bash
cd ./terraform/foundation
terraform init
terraform apply
cd ../..
```

```bash
cd ./terraform/project
terraform init
terraform apply
cd ../..
```

### Configurar Ghost

Enviar el archivo de configuración de Ghost al servidor

```bash
scp -i terraform/secure/id_ecdsa_ghost ./docker/config.production.json ghost@ghost.appbajopruebas.com:~/config.production.json
```

modificar el campo `url` en el archivo `config.production.json` con la dirección del servidor

```json
{
  "url": "http://ghost.appbajopruebas.com",
  "server": {
    "port": 2368,
    "host": "::"
  }
```

### Cambiar las credenciales auth_basic a nginx para proteger ghost (Las credenciales reales se les compartiran en los archivos de la entrega)

```bash
# desde el servidor (como root) se cambia la contraseña de auth_basic_user_file que protege ghost
htpasswd -c /etc/nginx/.htpasswd monitores
```

## Acceder al despliegue del proyecto

[https://ghost.appbajopruebas.com/](https://ghost.appbajopruebas.com/)

### Credenciales para acceder por el navegador (Credenciales reales se les compartiran en los archivos de la entrega)

- Usuario: monitores
- Contraseña: passwordqueluegosecambia

### Header que se debe poner en las HTTP Requests (Credenciales reales se les compartiran en los archivos de la entrega)

- Header: Authorization
- Value: Basic bW9uaXRvcmVzOnBhc3N3b3JkcXVlbHVlZ29zZWNhbWJpYQ==

```bash
# Nota: bW9uaXRvcmVzOnBhc3N3b3JkcXVlbHVlZ29zZWNhbWJpYQ== es la codificación Base64 de monitores:passwordqueluegosecambia
node -e "console.log(btoa(process.argv[1]))" -- "monitores:passwordqueluegosecambia"
```

https://github.com/hashicorp/learn-terraform-provisioning/blob/cloudinit/instances/main.tf

ivLTpHPYURNkSd8
