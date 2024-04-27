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

# Mapa que nos guia al archivo de configuracion de cada prueba de nuestro plan de puebas segun su 🧨T.N.T.🧨
locals {
  map_tnt_configs = {
    "☕" = { # Automatica - Unit testing soportadas con mocha.
      "default" = "../cloud-init-unit-testing.yml"
    },
    "🐒" = { # Automatizada - soportadas con Explorador aleatorio soportadas con Cypress.
      "default" = "../cloud-init-monkey.yml"
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

module "pair_vms_for_testing" {
  for_each = toset(["☕-1", "🐒-1", "🎩-1"]) # [... , "🎭-1", "🦑-1", "🎭🐼-1", "🦑🐼-1", "🎭-2", "🦑-2", "🪃-1"] # [... "⚖️-1", "🛡️-1"]
  source   = "./modules/pair-vms-for-testing"
  # - (1) aws_ami (ubuntu server 22.04 amd64 image)
  # - (2) template_file
  # - (2) aws_instance
  region               = var.region
  name                 = each.key
  subnet_public_id     = module.network.subnet_public_id
  security_group_id    = module.network.security_group_id
  cloud_init_abp_ghost = var.cloud_init_abp_ghost
  cloud_init_desired_test = local.map_tnt_configs["${
    substr(each.key, 0, 1)
    }"]["${
    substr(each.key, 1, 2) != "-" ? substr(each.key, 1, 2) : "default"
  }"]
}
