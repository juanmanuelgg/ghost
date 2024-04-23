#!/bin/bash

AQUI=$PWD

# Documentar la infraestuctura usada
cd ../..
cd servers/aws
ls -d | awk -f "${AQUI}/documentation.awk" | bash -x
cd $AQUI

# Documentar los modulos
cd ../..
cd servers/aws/modules
ls | awk -f "${AQUI}/documentation.awk" | bash -x
cd $AQUI
