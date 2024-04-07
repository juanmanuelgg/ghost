# Ghost

## Prender/Apagar Ghost usando Docker

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

Se requieren 2 pasos para configurar este despliegue de Ghost:

- 1. Remover el comentario de la línea 7 en el archivo `./docker/docker-compose.yml`

  ```yaml
  # - ./config.production.json:/var/lib/ghost/config.production.json
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
