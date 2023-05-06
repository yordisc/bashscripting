#!/bin/bash
cd ~
# URL de descarga
version="0.05"
url="https://github.com/puneetsl/lotion/releases/download/V-$version/Lotion-native.tar.gz"

# Color de texto
yellow='\033[1;33m'
green='\033[1;32m'
red='\033[1;31m'
nc='\033[0m'

# Descargar el archivo
printf "${yellow}Descargando archivo...${nc}\n"
wget -q "$url" -P /tmp

# Descomprimir el archivo
printf "${yellow}Descomprimiendo archivo...${nc}\n"
sudo tar -xzf /tmp/Lotion-native.tar.gz -C /opt

# Dar permisos necesarios
printf "${yellow}Asignando permisos...${nc}\n"
sudo chmod +x /opt/Lotion/Lotion

# Crear acceso directo
printf "${yellow}Creando acceso directo...${nc}\n"
cat <<EOF > ~/.local/share/applications/Lotion.desktop
[Desktop Entry]
Name=Lotion
Exec=/opt/Lotion/Lotion
Icon=/opt/Lotion/resources/app/icon.png
Terminal=false
Type=Application
EOF

# Eliminar el archivo comprimido
printf "${yellow}Eliminando archivo comprimido...${nc}\n"
rm /tmp/Lotion-native.tar.gz

# Comprobar si se completó correctamente
if [ $? -eq 0 ]; then
  printf "${green}Proceso completado con éxito.${nc}\n"
else
  printf "${red}Error al completar el proceso.${nc}\n"
fi