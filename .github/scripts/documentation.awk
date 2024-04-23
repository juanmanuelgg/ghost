#!/bin/awk -f

BEGIN {}    # Begin section
# Loop section
{
    entrar="cd "$0
    crear_documentacion="docker run --rm --volume \"$(pwd):/terraform-docs\" -u $(id -u) quay.io/terraform-docs/terraform-docs:0.16.0 markdown /terraform-docs > README.md"
    formatear="npx prettier --write README.md"
    volver="cd .."
    printf("%s; %s; %s; %s\n", entrar, crear_documentacion, formatear, volver)
}
END{}       # End section
