#!/bin/bash

# Versión del programa
version="2.2.0"

# URL de descarga
url="https://github.com/TheAssassin/AppImageLauncher/releases/download/v$version/appimagelauncher-lite-$version-travis995-0f91801-x86_64.AppImage"

# Colores para la salida
amarillo="\033[1;33m"
verde="\033[1;32m"
rojo="\033[1;31m"
reset_color="\033[0m"

# Función para imprimir texto en amarillo
function amarillo() {
  echo -e "${amarillo}$1${reset_color}"
}

# Función para imprimir texto en verde
function verde() {
  echo -e "${verde}$1${reset_color}"
}

# Función para imprimir texto en rojo
function rojo() {
  echo -e "${rojo}$1${reset_color}"
}

# Descarga y ejecución de AppImageLauncher
amarillo "Descargando AppImageLauncher..."
wget -q "$url" -O appimagelauncher-lite-$version-x86_64.AppImage
if [ $? -eq 0 ]; then
  amarillo "Estableciendo permisos de ejecución en AppImageLauncher..."
  chmod +x appimagelauncher-lite-$version-x86_64.AppImage
  amarillo "Ejecutando AppImageLauncher..."
  ./appimagelauncher-lite-$version-x86_64.AppImage
  if [ $? -eq 0 ]; then
    verde "AppImageLauncher se ha ejecutado correctamente."
  else
    rojo "Ha ocurrido un error al ejecutar AppImageLauncher."
  fi
else
  rojo "Ha ocurrido un error al descargar AppImageLauncher."
fi

# Borrado de la descarga
amarillo "Eliminando la descarga de AppImageLauncher..."
rm appimagelauncher-lite-$version-x86_64.AppImage