#!/bin/bash 
### Hecho por Yordis Cujar
### https://www.microsoft.com/es-es/edge/download?form=MA13FJ

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
			echo -e "\033[34m####### Instalar Edge ########"
			echo -e "\033[34m##############################"
			echo " "
			echo " "
			sleep 2s
		clear

}		


function instalador () {
PS3="Elige tu diestro de linux: [1: para salir]" 
select opt in salir debian fedora; 
do 

	case $opt in 

		salir)
			break;; 

		debian)
			cd ~
			rm 3dg3-st@bl3.txt
# Obtener la lista de archivos de la carpeta
			wget -q -O - https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/ | grep -o 'href="[^"]*"' | cut -d '"' -f 2 > 3dg3-st@bl3.txt
# Ordenar los archivos por versión y obtener el último
			latest_file=$(sort -V 3dg3-st@bl3.txt | tail -n 1)
# Descargar el archivo usando wget
			wget https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/$latest_file
# Instalar
			sudo dpkg -i $latest_file
			rm 3dg3-st@bl3.txt
			rm $latest_file
			cd ~
						echo -e "\033[32m#----------------------------Edge instalado-----------------------------#"
					sleep 3s
		clear
			;; 

		fedora)
			cd ~
			rm 3dg3-st@bl3.txt
# Obtener la lista de archivos de la carpeta
			wget -q -O - https://packages.microsoft.com/yumrepos/edge/ | grep -o 'href="[^"]*"' | cut -d '"' -f 2 > 3dg3-st@bl3.txt
# Ordenar los archivos por versión y obtener el último
			latest_file=$(sort -V 3dg3-st@bl3.txt | grep rpm | tail -n 1)
# Descargar el archivo usando wget
			wget https://packages.microsoft.com/yumrepos/edge/$latest_file
# Instalar
			sudo rpm -ivh $latest_file # o sudo yum install $latest_file
			rm 3dg3-st@bl3.txt
			rm $latest_file
			cd ~
			echo -e "\033[32m#----------------------------Edge instalado-----------------------------#"
					sleep 3s
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

