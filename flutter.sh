#!/bin/bash
usuario="cujar"
versionft="3.19.3"

cd /home/$usuario

# Actualizar el sistema
sudo apt update && sudo apt upgrade

# Instalar dependencias básicas
sudo apt install -y git curl wget unzip xz-utils
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
sudo apt-get install clang cmake git ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev

# Instalar Java
sudo apt install -y openjdk-11-jdk

# Descargar Flutter SDK

rm flutter_linux_$versionft-stable.tar.xz

wget -P /home/$usuario https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_$versionft-stable.tar.xz

sudo chmod +x flutter_linux_$versionft-stable.tar.xz
sudo tar -xf flutter_linux_$versionft-stable.tar.xz -C /home/$usuario/

# Agregar Flutter al path
echo 'export PATH="$PATH:/home/$usuario/flutter/bin"' >> ~/.bashrc

# Agregar Flutter al path (zsh)
echo 'export PATH="$PATH:/home/$usuario/flutter/bin"' >> ~/.zshrc

export PATH="$PATH:`pwd`/flutter/bin"

flutter precache

# Actualizar el path (zsh)
source ~/.zshrc  # O reinicia la terminal

flutter doctor -v

# Iniciar Android Studio y aceptar las licencias
#studio