from diagrams import Cluster, Diagram
from diagrams.onprem.container import Docker
from diagrams.aws.compute import EC2
from diagrams.custom import Custom
from diagrams.onprem.database import MySQL 
from diagrams.aws.general import GenericFirewall


with Diagram("Presupuesto en desarrollo", show=False):
    # https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/GoDaddy_Logo_-_The_GO.svg/269px-GoDaddy_Logo_-_The_GO.svg.png
    dns = Custom("dns", "./GoDaddy.png")

    sg_22_80_443 = GenericFirewall("sg_22_80_443")

    with Cluster("modules"):
        tools_group = [Docker("e2e-cypress(⚪)"),
                     Docker("e2e-kraken(🦑)"),
                     Docker("e2e-playwright(🎭)"),
                     Docker("e2e-puppeteer(🏗️)"),
                     Docker("monkey(🐒)"),
                     Docker("ripper(🎩)"),
                     Docker("smart-monkey(🦧)")
                    ]

    with Cluster("abp"):
        abp_ghost = [EC2("ghost(👻)"),
                    MySQL("db")]

    list_dns = [abp_ghost[0]]

    dns >> sg_22_80_443 >> list_dns
    tools_group >> abp_ghost[0]
    abp_ghost[0] - abp_ghost[1]