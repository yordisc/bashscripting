#!/bin/bash

# Versión del programa
version="1.0.83"
cd ~

# URLs de descarga
url_fedora="https://github.com/IsmaelMartinez/teams-for-linux/releases/download/v$version/teams-for-linux-$version.x86_64.rpm"
url_debian="https://github.com/IsmaelMartinez/teams-for-linux/releases/download/v$version/teams-for-linux_$version_amd64.deb"
url_appimage="https://github.com/IsmaelMartinez/teams-for-linux/releases/download/v$version/teams-for-linux-$version.AppImage"

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

# Función para instalar un paquete RPM
function instalar_rpm() {
  amarillo "Descargando el paquete RPM..."
  wget -q "$url_fedora" -O teams-for-linux-$version.x86_64.rpm
  if [ $? -eq 0 ]; then
    amarillo "Instalando el paquete RPM..."
    sudo dnf install -y teams-for-linux-$version.x86_64.rpm
    if [ $? -eq 0 ]; then
      verde "El paquete RPM se ha instalado correctamente."
    else
      rojo "Ha ocurrido un error al instalar el paquete RPM."
    fi
    amarillo "Eliminando el paquete RPM..."
    rm teams-for-linux-$version.x86_64.rpm
  else
    rojo "Ha ocurrido un error al descargar el paquete RPM."
  fi
}

# Función para instalar un paquete DEB
function instalar_deb() {
  amarillo "Descargando el paquete DEB..."
  wget -q "$url_debian" -O teams-for-linux_$version_amd64.deb
  if [ $? -eq 0 ]; then
    amarillo "Instalando el paquete DEB..."
    sudo dpkg -i teams-for-linux_$version_amd64.deb
    if [ $? -eq 0 ]; then
      verde "El paquete DEB se ha instalado correctamente."
    else
      rojo "Ha ocurrido un error al instalar el paquete DEB."
    fi
    amarillo "Eliminando el paquete DEB..."
    rm teams-for-linux_$version_amd64.deb
  else
    rojo "Ha ocurrido un error al descargar el paquete DEB."
  fi
}

# Función para instalar un paquete AppImage
function instalar_appimage() {
  amarillo "Descargando el paquete AppImage..."
  wget -q "$url_appimage" -O teams-for-linux-$version.AppImage
  if [ $? -eq 0 ]; then
    amarillo "Estableciendo permisos de ejecución en el paquete AppImage..."
    chmod +x teams-for-linux-$version.AppImage
    amarillo "Ejecutando el paquete AppImage..."
    ./teams-for-linux-$version.AppImage
    if [ $? -eq 0 ]; then
      verde "El paquete AppImage se ha instalado correctamente."
    else
      rojo "Ha ocurrido un error al instalar el paquete AppImage."
    fi
    amarillo "Eliminando el paquete AppImage..."
    rm teams-for-linux-$version.AppImage
  else
    rojo "Ha ocurrido un error al descargar el paquete AppImage."
  fi
}

# Menú principal
while true; do
  echo "Selecciona la opción que deseas:"
  echo "1. Instalar la versión para Fedora"
  echo "2. Instalar la versión para Debian"
  echo "3. Instalar la versión AppImage"
  echo "4. Salir"
  read opcion
  case $opcion in
    1)
      instalar_rpm
      ;;
    2)
      instalar_deb
      ;;
    3)
      instalar_appimage
      ;;
    4)
      exit 0
      ;;
    *)
      rojo "Opción inválida. Inténtalo de nuevo."
      ;;
  esac
done