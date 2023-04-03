#!/bin/bash 
### Hecho por Yordis Cujar
### https://dbeaver.io/

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
			echo -e "\033[34m####### Instalar DBEABER #######"
			echo -e "\033[34m##############################"
			echo " "
			echo " "
			sleep 2s
		clear

}		


function instalador () {
### 

PS3="Elige tu diestro de linux: [1: para salir]" 
select opt in salir debian fedora flatpak snap; 
do 

	case $opt in 

		salir)
			break;; 

		debian)
			wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb
			sudo dpkg -i -f dbeaver-ce_latest_amd64.deb
			echo "#----------------------------Instalado DBeaver-----------------------------#"
			;; 

		fedora)
			wget https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm
			sudo rpm -ih dbeaver-ce-latest-stable.x86_64.rpm
			echo "#----------------------------Instalado DBeaver-----------------------------#"
			;;

		flatpak)
			flatpak install flathub io.dbeaver.DBeaverCommunity
			echo "#----------------------------Instalado DBeaver-----------------------------#"
			;;

		snap)
			sudo snap remove dbeaver-ce
			sudo snap install dbeaver-ce
			sudo cp /var/lib/snapd/desktop/applications/* /usr/share/applications/
			sudo ln -s $HOME/.local/share/fonts $HOME/snap/dbeaver-ce/current/.local/share/
			echo "#----------------------------Instalado DBeaver - Snap-----------------------------#"
			;; 

		*)
			echo "$REPLY opción inválida"
			;; 

	esac 

done


}


##### Inicio del programa ######

			cd ~
			rm -r dbeaverX
			mkdir dbeaverX
			clear
			fabricante
			chiguire
			inicio
			version
			instalador
			chiguire
			fabricante
			rm -r dbeaverX

