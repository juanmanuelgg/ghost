from diagrams import Cluster, Diagram
from diagrams.generic.virtualization import Virtualbox
from diagrams.aws.compute import EC2
from diagrams.custom import Custom
from diagrams.onprem.database import MySQL 
from diagrams.aws.general import GenericFirewall


with Diagram("Presupuesto en staging", show=False):
    # https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/GoDaddy_Logo_-_The_GO.svg/269px-GoDaddy_Logo_-_The_GO.svg.png
    dns = Custom("dns", "./GoDaddy.png")

    sg_22_80_443 = GenericFirewall("sg_22_80_443")

    with Cluster("modules"):
        tools_group = [Virtualbox("e2e-cypress(⚪)"),
                     Virtualbox("e2e-kraken(🦑)"),
                     Virtualbox("e2e-playwright(🎭)"),
                     Virtualbox("e2e-puppeteer(🏗️)"),
                     Virtualbox("monkey(🐒)"),
                     Virtualbox("ripper(🎩)"),
                     Virtualbox("smart-monkey(🦧)")
                    ]

    with Cluster("abp"):
        abp_ghost = [EC2("ghost(👻)"),
                    MySQL("db")]

    list_dns = [abp_ghost[0]]

    dns >> sg_22_80_443 >> list_dns
    tools_group >> abp_ghost[0]
    abp_ghost[0] - abp_ghost[1]