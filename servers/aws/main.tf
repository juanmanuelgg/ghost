module "network" {
  source = "./modules/network"
  # - (1) aws_vpc
  # - (1) aws_internet_gateway
  # - (1) aws_subnet
  # - (1) aws_route_table
  # - (1) aws_route_table_association
  # - (1) aws_security_group
  cidr_vpc    = var.cidr_vpc
  cidr_subnet = var.cidr_subnet
}

# Mapa que nos guia al archivo de configuracion de cada prueba de nuestro plan de puebas, segun su 🧨T.N.T.🧨 (no se define aqui sino en los docs).
locals {
  map_tnt_configs = {
    "👻" = { # App Bajo Pruebas (Ghost).
      "default" = "../cloud-init-abp-ghost.yml"
    },
    "☕" = { # Automatica - Unit testing soportadas con mocha.
      "default" = "../cloud-init-unit-testing.yml"
    },
    "🐒" = { # Automatizada - soportadas con Explorador aleatorio soportadas con Cypress.
      "default" = "../cloud-init-monkey.yml"
    },
    "🦧" = { # Automatizada - soportadas con Explorador aleatorio soportadas con Cypress.
      "default" = "../cloud-init-smart-monkey.yml"
    },
    "🎩" = { # Automatizada - soportadas con Explorador sistematico soportadas con Puppeteer,
      "default" = "../cloud-init-ripper.yml"
    },
    "⚪" = {                                                # Automatizada - End-to-End Testing soportadas con Cypress.
      "🐼"       = "../cloud-init-cypress-random-data.yml", # Entrada de datos aleatorios, con Faker.js.
      "📐"       = "../cloud-init-cypress-fix-data.yml",    # Entrada de datos fijos.
      "default" = "../cloud-init-cypress-fix-data.yml"
    },
    "🎭" = {                                                   # Automatizada - End-to-End Testing soportadas con Playwright.
      "🐼"       = "../cloud-init-playwright-random-data.yml", # Entrada de datos aleatorios, con Faker.js.
      "📐"       = "../cloud-init-playwright-fix-data.yml",    # Entrada de datos fijos.
      "default" = "../cloud-init-playwright-fix-data.yml"
    },
    "🏗️" = {                                                  # Automatizada - End-to-End Testing soportadas con Puppeteer.
      "🐼"       = "../cloud-init-puppeteer-random-data.yml", # Entrada de datos aleatorios, con Faker.js.
      "📐"       = "../cloud-init-puppeteer-fix-data.yml",    # Entrada de datos fijos.
      "default" = "../cloud-init-puppeteer-fix-data.yml"
    },
    "🦑" = {                                               # Automatizada - End-to-End Testing soportadas con Kraken.
      "🐼"       = "../cloud-init-kraken-random-data.yml", # Entrada de datos aleatorios, con Faker.js.
      "📐"       = "../cloud-init-kraken-fix-data.yml",    # Entrada de datos fijos.
      "default" = "../cloud-init-kraken-fix-data.yml"
    },
    "🪃" = {                                         # Automatica - Visual Regression Testing
      "🟣"       = "../cloud-init-vrt-resemble.yml"  # Usando Resemble.js.
      "🦝"       = "../cloud-init-vrt-backstop.yml", # Usando BackstopJS.
      "default" = "../cloud-init-vrt-backstop.yml"
    },
    "⚖️" = {                                        # Automatica - Load Testing
      "⏱️"       = "../cloud-init-load-jmeter.yml"  # Usando Apache JMeter™.
      "🦗"       = "../cloud-init-load-locust.yml", # Usando Locust.
      "default" = "../cloud-init-load-locust.yml"
    },
    "🛡️" = { # Automatica - Static Application Security Testing soportadas con ¿?¿?¿?
      "default" = "../cloud-init-sast.yml"
    }
  }
}

# Entrega Semana 4 (1era implementación. Exploración) (25 Horas de ejecucion por cada máquina/componente.).
# Presupuesto 1: 200 Horas AWS EC2 ["🐒-1", "🦧-1", "🦧-2", "🎩-1"]
# Presupuesto 2: 400 Horas AWS EC2 ["🐒-1", "🐒-2", "🦧-1", "🦧-2" "🦧-3", "🦧-4", "🎩-1", "🎩-2"] 

# Entrega Semana 5 (2da implementación. E2E).
# [... , "🎭-1", "🦑-1"]

# Entrega Semana 6 (2da implementación. VRT).
# [... , "🎭-2", "🦑-2", "🪃-1"] 

# Entrega Semana 7 (3era implementación. Generación de datos).
# [... , "🎭🐼-1", "🦑🐼-1"]

# No se ven en el curso pero se hablaron en el presupuesto =>  [... "☕-1", "⚖️-1", "🛡️-1"]
locals {
  con_parejas = false # En este entrega necesito una instancia constantemente prendida a la que todas las otras maquinas apunten
}

module "pair_vms_for_testing" {
  for_each = toset(["👻-1"]) # En una primera etapa prendemos ghost y lo cuadramos.
  # for_each = toset(["👻-1", "🐒-1", "🦧-1", "🎩-1"]) # Entrega sprint 1. Pruebas exploratorias.
  # for_each = toset(["👻-1", "🎭-1", "🦑-1"]) # Entrega sprint 2. Pruebas E2E.
  source = "./modules/pair-vms-for-testing"
  # - (1) aws_ami (ubuntu server 22.04 amd64 image)
  # - (2) template_file
  # - (2) aws_instance
  region                  = var.region
  name                    = each.key
  subnet_public_id        = module.network.subnet_public_id
  security_group_id       = module.network.security_group_id
  cloud_init_abp_ghost    = var.cloud_init_abp_ghost
  cloud_init_desired_test = local.map_tnt_configs["${substr(each.key, 0, 1)}"].default
  con_parejas             = local.con_parejas
}
