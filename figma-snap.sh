!/bin/bash
# Hecho por Yordis Cujar
# Version 1

			sudo snap install figma-linux
			sudo cp /var/lib/snapd/desktop/applications/* /usr/share/applications/
			sudo ln -s $HOME/.local/share/fonts $HOME/snap/figma-linux/current/.local/share/
			echo "#----------------------------Instalado Figma - Snap-----------------------------#"