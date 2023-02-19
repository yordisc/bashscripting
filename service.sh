#!/bin/bash 
### Hecho por Yordis Cujar
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
			echo -e "\033[34m################################"
			echo -e "\033[34m# Activar/Desactivar Servicios #"
			echo -e "\033[34m################################"
			echo " "
			echo " "
			sleep 2s
		clear

}		

function activar()

{
		clear
			echo -e "\033[32mIniciando..."
			sleep 2s
			dunst
# servicios
			sudo systemctl start smbd
			sudo systemctl start nmbd
			sudo systemctl start teamviewerd.service
			sudo systemctl start snapd
			sudo systemctl start snap.socket
			sudo systemctl start mysql
			sudo systemctl start docker.socket
			sudo systemctl start docker.service
			sudo systemctl start containerd
# Xampp Start
			sudo apachectl start
			sudo /opt/lampp/lampp start
#free-ram
			sudo sync && sudo sysctl -w vm.drop_caches=3
			echo -e "\033[32m#----------------------------Servicios Activados-----------------------------#"
}

function desactivar()

{
		clear
			echo -e "\033[32mIniciando..."
			sleep 2s
			killall pcloud
			killall dunst
			killall apache2
# servicios
			sudo systemctl stop smbd
			sudo systemctl stop nmbd
			sudo systemctl stop snapd
			sudo systemctl stop snap.socket
			sudo systemctl stop teamviewerd.service
			sudo systemctl stop mysql
			sudo systemctl stop docker.socket
			sudo systemctl stop docker.service
			sudo systemctl stop containerd
# Xampp Stop
			sudo apachectl stop
			sudo /opt/lampp/lampp stop
#free-ram
			sudo sync && sudo sysctl -w vm.drop_caches=3
			echo -e "\033[32m#----------------------------Servicios Desactivados-----------------------------#"
}

##### Inicio del programa ######


			fabricante
			chiguire
			inicio


##### MENU ######		
PS3="¿ Que quieres hacer? " 

select opt in Activar Desactivar Salir; 

do 

	case $opt in 
##### OPCIONES ######		
		Activar)
			activar
					;; 

		Desactivar)
			desactivar
					;; 

		Salir) 
			chiguire
			fabricante
			break
			;; 

		*)
			echo -e "\033[31m$REPLY inválido"
			;; 

	esac 

done