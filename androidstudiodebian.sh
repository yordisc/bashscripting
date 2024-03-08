#!/bin/bash
usuario="cujar"
versionas="2023.2.1.23"
cd /home/$usuario

# Actualizar el sistema
sudo apt update && sudo apt upgrade

# Instalar dependencias básicas
sudo apt install -y git curl wget unzip xz-utils

# Crear un grupo para Android Studio
sudo groupadd android-studio

# Agregar el usuario actual al grupo
sudo usermod -aG android-studio $USER

rm android-studio-$versionas-linux.tar.gz

# Descargar Android Studio
wget -P /home/$usuario https://redirector.gvt1.com/edgedl/android/studio/ide-zips/$versionas/android-studio-$versionas-linux.tar.gz

# Extraer el archivo descargado
sudo tar -xf android-studio-$versionas-linux.tar.gz -C /opt/

# Cambiar la propiedad de la carpeta de Android Studio al grupo
sudo chown -R :android-studio /opt/android-studio

# Otorgar permisos de ejecución al script de inicio
sudo chmod +x /opt/android-studio/bin/studio.sh

# Crear un enlace simbólico a la aplicación
sudo ln -s /opt/android-studio/bin/studio.sh /usr/bin/studio

# Iniciar Android Studio y aceptar las licencias
studio