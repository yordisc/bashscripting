#!/bin/bash

yellow='\033[33m'
blue='\033[34m'
red='\033[31m'
reset='\033[0m'

debian=deb
fedora=rpm
installdebian="dpkg -i"
installfedora="rpm -i"

linux=$debian
install=$installdebian

function installvscode(){
    # Descarga el paquete de instalación de la última versión de VSCode
    tput setaf 3 # Amarillo
    echo "Descargando Visual Studio Code..."
    tput sgr0 # Restablece el color
    wget -O vscode.$linux "https://code.visualstudio.com/sha/download?build=stable&os=linux-$linux-x64"

    # Comprueba el código de salida de wget
    if [ $? -eq 0 ]
    then
        tput setaf 2 # Verde
        echo "Visual Studio Code descargado correctamente"
        tput sgr0 # Restablece el color

        # Instala el paquete de instalación
        tput setaf 3 # Amarillo
        echo "Instalando Visual Studio Code..."
        tput sgr0 # Restablece el color
        sudo $install vscode.$linux

        # Comprueba el código de salida de la instalación
        if [ $? -eq 0 ]
        then
            tput setaf 2 # Verde
            echo "Ultima versión de Visual Studio Code instalado correctamente"
            tput sgr0 # Restablece el color

            # Borra el paquete de instalación
            tput setaf 3 # Amarillo
            echo "Borrando paquete de instalación..."
            tput sgr0 # Restablece el color
            rm vscode.$linux
        else
            tput setaf 1 # Rojo
            echo "Error al instalar Visual Studio Code"
            tput sgr0 # Restablece el color
        fi
    else
        tput setaf 1 # Rojo
        echo "Error al descargar Visual Studio Code"
        tput sgr0 # Restablece el color
    fi
}

echo -e "${yellow}¿Qué versión de Visual Studio Code deseas instalar?"
echo -e "${yellow}https://github.com/yordisc/BashScripting"
echo -e ""
echo -e "${red}1.Debian"
echo -e "${blue}2.Fedora"
read option

case $option in
    1)
        clear
        linux=$debian
        install=$installdebian
        installvscode
        ;;
    2)
        clear
        linux=$fedora
        install=$installfedora
        installvscode
        ;;
    *)
        echo "Opción no válida"
        ;;
esac