#!/bin/bash
# Hecho por Yordis Cujar
# Version 1

sudo rm /opt/pcloud
sudo rm /opt/pcloud.appimage
# Descarga la última versión de pCloud
tput setaf 3 # Amarillo
echo "Descargando pCloud..."
tput sgr0 # Restablece el color
wget -O pcloud.appimage "https://p-def2.pcloud.com/cBZ0SKsydZa6UFOrZZZLhWno7Z2ZZraLZkZUD0DVZVHZbZe4ZGLZTzZNzZTHZv0ZQ4Z4JZt5Z0LZG5ZWJZyc9wVZYNzhCryxxQytsc0y4daYfk6bmRyy/pcloud"

# Comprueba el código de salida de wget
if [ $? -eq 0 ]
then
    tput setaf 2 # Verde
    echo "pCloud descargado correctamente"
    tput sgr0 # Restablece el color

    # Hace el archivo AppImage ejecutable
    tput setaf 3 # Amarillo
    echo "Haciendo pCloud ejecutable..."
    tput sgr0 # Restablece el color
    chmod +x pcloud.appimage

    # Mueve el archivo AppImage a /opt
    tput setaf 3 # Amarillo
    echo "Moviendo pCloud a /opt..."
    tput sgr0 # Restablece el color
    sudo mv pcloud.appimage /opt/pcloud.appimage

    # Crea un acceso directo en el menú de aplicaciones
    tput setaf 3 # Amarillo
    echo "Creando acceso directo en el menú de aplicaciones..."
    tput sgr0 # Restablece el color
    sudo rm /usr/share/applications/pcloud.desktop
    sudo bash -c 'cat > /usr/share/applications/pcloud.desktop <<EOF
[Desktop Entry]
Name=pCloud
Exec=/opt/pcloud.appimage
Icon=
Terminal=false
Type=Application
Categories=Internet;
EOF'

    # Comprueba si la instalación tuvo éxito
    if [ $? -eq 0 ]
    then
        tput setaf 2 # Verde
        echo "pCloud instalado correctamente"
        tput sgr0 # Restablece el color
    else
        tput setaf 1 # Rojo
        echo "Error al crear el acceso directo en el menú de aplicaciones"
        tput sgr0 # Restablece el color
    fi
else
    tput setaf 1 # Rojo
    echo "Error al descargar pCloud"
    tput sgr0 # Restablece el color
fi