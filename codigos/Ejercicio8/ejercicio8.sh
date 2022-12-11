#!/bin/bash
echo "$*" | awk '{ printf "%s", $0 }'

#Aregamos el bin bash y eliminamos el echon() y sus llaves para que funcione correctamente
