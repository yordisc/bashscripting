#!/bin/bash 
### Hecho por Yordis Cujar
### https://github.com/Figma-Linux/figma-linux

FECHA=$(date +"%Y-%m-%d")

function chiguire()

{
		clear
			echo -e "\033[33m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@%#++*###*=@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@#***++=-===+@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@=-=-+*++++*+#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@%*++-+*+**+**+*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@#=++#*+++=+++**%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@*====--:-=++*####%%@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@=   :=++*****+**####%%%%%@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@#::-=++****+=+++*###########%@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@*-==+++**++++++++*********#####%%@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@*=++++++++++++++******************%@@@@@@@"
			echo -e "\033[33m@@@@@@@@@+++**+===++++=++****#***********++%@@@@@@"
			echo -e "\033[33m@@@@@@@@@#=++**=-+====+****************++*+=#@@@@@"
			echo -e "\033[33m@@@@@@@@@@#=+++==---:-=+++***+*++*++***+**+==@@@@@"
			echo -e "\033[33m@@@@@@@@@@@*--.-==: .-=-==++++++++**+*****+==%@@@@"
			echo -e "\033[33m@@@@@@@@@@@@+:.:-==:..:--======*++**+**++*+==%@@@@"
			echo -e "\033[33m@@@@@@@@@@@@@=.:-=-%%-...::::-+**++*+++=++==-#@@@@"
			echo -e "\033[33m@@@@@@@@@@@@@*::=-=@@@%*=:..:=+++++=++==+==-:#@@@@"
			echo -e "\033[33m@@@@@@@@@%%*==.-=--+***+*+:  :-=--=:----:::.-@@@@@"
			echo -e "\033[33m@@@@@@@@%%*++--=----+====-:... ..::::---==+*@@@@@@"
			echo -e "\033[33m@@@@@@@@@@@@%%##**####%%%##****##%%%@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo -e "\033[33m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			sleep 2s
		clear
}


function fabricante()

{

		clear
			echo -e "\033[4mhttps://github.com/yordisc/"
			sleep 2s
		clear

}		


function inicio()

{

		clear
			echo " "
			echo " "
			echo -e "\033[34m##############################"
			echo -e "\033[34m####### Instalar Figma #######"
			echo -e "\033[34m##############################"
			echo " "
			echo " "
			sleep 2s
		clear

}		


function version()

{

Xversion="0.10.0"
			echo "elige la versión de Figma:"
read number
while ! [[ $number =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || [ "$number" -lt 1 ]; do
  echo "El valor introducido no es válido. Por favor, introduzca un número valido o tomara la versión $Xversion."
  read number
  if [[ -z "$number" ]]; then
    number="$Xversion"
  fi
done
    Xversion="$number"
			echo "elegiste la versión de Figma: ($Xversion)"
		sleep 2s
		clear
}

function correccion()

{
 ## Modificacion de la direccion del lanzador 
cd /usr/share/applications/
sudo chmod -R 777 figma-linux.desktop
sudo sed -i '41s/AppRun --no-sandbox/\/opt\/figma-linux.AppImage/g' figma-linux.desktop
cd ~

}


function figma () {
    figmaversion="$Xversion"
    
			cd
			mkdir f1gm@
			cd f1gm@
			rm figma-linux.AppImage
			wget https://github.com/Figma-Linux/figma-linux/releases/download/v$figmaversion/figma-linux_$figmaversion\_linux_x86_64.AppImage
			mv figma-linux_$figmaversion\_linux_x86_64.AppImage figma-linux.AppImage
			sudo chmod +x figma-linux.AppImage
			./figma-linux.AppImage -i
			mv figma-linux.AppImage /opt/
			cd
			rm -r f1gm@
			correccion
			echo -e "\033[32m#----------------------------Figma instalado-----------------------------#"
					sleep 3s
		clear
}


function installfigma () {
    installsystem="$installdeb"
    figmaversion="$Xversion"

			cd ~
			mkdir f1gm@
			cd f1gm@
			rm figma-linux.$system
			wget https://github.com/Figma-Linux/figma-linux/releases/download/v$figmaversion/figma-linux_$figmaversion\_linux_$systemline.$system
			mv figma-linux_$figmaversion\_linux_$systemline.$system figma-linux.$system
			sudo chmod +x figma-linux.$system
			$installsystem\figma-linux.$system $last
			cd ~
			echo -e "\033[32m#----------------------------Figma instalado-----------------------------#"
					sleep 3s
		clear
}


function instalador () {

#### Valores
installappimage="./"
normallast=""
installappimagelast="-i"
installdeb="sudo dpkg -i "
installarch="yay -S "
installrpm="sudo dnf install "
### 

PS3="Elige tu diestro de linux: [1: para salir]" 
select opt in salir debian fedora arch appimage snap; 
do 

	case $opt in 

		salir)
			break;; 

		debian)
			sudo apt install libgconf-2-4
			system="deb"
			installsystem="$installdeb"
			last="$normallast"
			systemline="amd64"
			installfigma
			rm -r f1gm@
			;; 

		fedora)
			system="rpm"
			installsystem="$installrpm"
			last="$normallast"
			systemline="x86_64"
			installfigma
			rm -r f1gm@
			;;

		arch)
			system="pacman"
			installsystem="$installarch"
			last="$normallast"
			systemline="amd64"
			installfigma
			rm -r f1gm@
			;; 

		appimage)
			system="AppImage"
			installsystem="$installappimage"
			last="$installappimagelast"
			systemline="x86_64"
			installfigma
			mv figma-linux.$system /opt/
			rm -r f1gm@
			correccion
			;; 

		snap)
			sudo snap remove figma-linux
			sudo snap install figma-linux
			sudo cp /var/lib/snapd/desktop/applications/* /usr/share/applications/
			sudo ln -s $HOME/.local/share/fonts $HOME/snap/figma-linux/current/.local/share/
			echo "#----------------------------Instalado Figma - Snap-----------------------------#"
			;; 

		*)
			echo "$REPLY opción inválida"
			;; 

	esac 

done


}


##### Inicio del programa ######


			fabricante
			chiguire
			inicio
			version
			instalador
			chiguire
			fabricante

