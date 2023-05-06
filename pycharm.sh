#!/bin/bash

age=$(date +%Y)
version="1.1"


function menu {
    echo ""
    echo "Seleccione una opción:"
    echo "1. Instalar PyCharm Community"
    echo "2. Desinstalar PyCharm Community"
    read option

    if [ "$option" = "1" ]; then
        echo "Ingrese el año de la versión de PyCharm (deje en blanco para usar $age):"
        read input_age
        if [ ! -z "$input_age" ]; then
            age="$input_age"
        fi

        echo "Ingrese la versión de PyCharm (deje en blanco para usar $version):"
        read input_version
        if [ ! -z "$input_version" ]; then
            version="$input_version"
        fi

        install_pycharm
    elif [ "$option" = "2" ]; then
        uninstall_pycharm
    else
        echo "Opción inválida."
        menu
    fi
}

function install_pycharm {

			cd ~

    echo "Descargando PyCharm Community $age.$version..."
    wget "https://download-cdn.jetbrains.com/python/pycharm-community-$age.$version.tar.gz"

    echo "Renombrando archivo..."
    mv "pycharm-community-$age.$version.tar.gz" "pycharm-community.tar.gz"

    echo "Descomprimiendo archivo..."
    tar -xzf "pycharm-community.tar.gz"

    echo "Renombrando carpeta..."
    mv "pycharm-community-$age.$version" "pycharm-community"

	echo "Moviendo carpeta a /opt..."
	sudo mv pycharm-community /opt
	chmod +x /opt/pycharm-community/bin/pycharm.sh

	echo "Creando acceso directo..."
sudo bash -c "cat >/usr/share/applications/pycharm.desktop" <<EOL
[Desktop Entry]
Version=$vesion
Type=Application
Name=PyCharm Community
Icon=/opt/pycharm-community/bin/pycharm.png
Exec=/opt/pycharm-community/bin/pycharm.sh
Comment=Python IDE
Categories=Development;IDE;
EOL

    echo "Eliminando archivos residuales..."
    rm "$HOME/pycharm-community.tar.gz"
    rm -rf "$HOME/pycharm-community"
    
	#echo "Ejecutando instalación..."
	#./pycharm-community/bin/pycharm.sh
    
}

function uninstall_pycharm {
    echo "Desinstalando PyCharm Community..."
    sudo rm -rf "/opt/pycharm-community"
    rm -rf "pycharm-community"
    rm -rf "~/.config/JetBrains/PyCharmCE$age.$version"
    rm -rf "~/.local/share/JetBrains/PyCharmCE$age.$version"
    echo "PyCharm Community ha sido desinstalado."
}

menu