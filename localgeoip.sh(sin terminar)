#!/bin/bash 
FECHA=$(date +"%Y-%m-%d")


function verificaip(){
ip=$(curl -s https://ipinfo.io/ip)

if [ -n "$ip" ]; then
    curl -s https://ipvigilante.com/"$ip" | jq '.data.latitude, .data.longitude, .data.city_name, .data.country_name'
else
    echo "No se pudo obtener la dirección IP"
fi
}

function youip(){
			curl -s https://ipvigilante.com/$(curl -s https://ipinfo.io/ip) | jq '.data.latitude, .data.longitude, .data.city_name, .data.country_name'
}

function direccionip(){
			echo "colocala la IP aqui:"
			read direccionip
			curl -s https://ipvigilante.com/$direccionip | jq '.data.latitude, .data.longitude, .data.city_name, .data.country_name'
}

function chiguire(){
			echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo "@@@@@@@%#++*###*=@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo "@@@@@#***++=-===+@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo "@@@@=-=-+*++++*+#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo "@@@%*++-+*+**+**+*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo "@@@@#=++#*+++=+++**%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo "@@@@@*====--:-=++*####%%@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo "@@@@@@@@=   :=++*****+**####%%%%%@@@@@@@@@@@@@@@@@"
			echo "@@@@@@@@#::-=++****+=+++*###########%@@@@@@@@@@@@@"
			echo "@@@@@@@@*-==+++**++++++++*********#####%%@@@@@@@@@"
			echo "@@@@@@@@*=++++++++++++++******************%@@@@@@@"
			echo "@@@@@@@@@+++**+===++++=++****#***********++%@@@@@@"
			echo "@@@@@@@@@#=++**=-+====+****************++*+=#@@@@@"
			echo "@@@@@@@@@@#=+++==---:-=+++***+*++*++***+**+==@@@@@"
			echo "@@@@@@@@@@@*--.-==: .-=-==++++++++**+*****+==%@@@@"
			echo "@@@@@@@@@@@@+:.:-==:..:--======*++**+**++*+==%@@@@"
			echo "@@@@@@@@@@@@@=.:-=-%%-...::::-+**++*+++=++==-#@@@@"
			echo "@@@@@@@@@@@@@*::=-=@@@%*=:..:=+++++=++==+==-:#@@@@"
			echo "@@@@@@@@@%%*==.-=--+***+*+:  :-=--=:----:::.-@@@@@"
			echo "@@@@@@@@%%*++--=----+====-:... ..::::---==+*@@@@@@"
			echo "@@@@@@@@@@@@%%##**####%%%##****##%%%@@@@@@@@@@@@@@"
			echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
			sleep 3s
		clear
}


function encabezado(){
		echo "https://github.com/yordisc/"
		echo " "
		echo " "
		echo "##############################"
		echo "#   Localizar Dirección IP   #"
		echo "##############################"
		echo " "
		echo "usala los números (salir:)"
		sleep 3s
		clear
}

function diestro(){
PS3="Elige tu diestro de linux: "

select opt in salir Debian Fedora CentOS  openSUSE; do
	case $opt in 

		Debian)
			echo "#----------------------------Instalando Requisitos Obligatorios-----------------------------#"
			sleep 2s
			sudo apt install curl jq		#Ubuntu/Debian
			echo "#----------------------------Instalado Requisitos Obligatorios-----------------------------#"
			clear
			;; 

		Fedora)
			echo "#----------------------------Instalando Requisitos Obligatorios-----------------------------#"
			sleep 2s
			sudo dnf install curl jq		#Fedora 22+
			echo "#----------------------------Instalado Requisitos Obligatorios-----------------------------#"
			clear
			;; 

		CentOS)
			echo "#----------------------------Instalando Requisitos Obligatorios-----------------------------#"
			sleep 2s
			sudo yum install curl jq		#CentOS/RHEL
			echo "#----------------------------Instalado Requisitos Obligatorios-----------------------------#"
			clear
			;; 

		openSUSE)
			echo "#----------------------------Instalando Requisitos Obligatorios-----------------------------#"
			sleep 2s
			sudo zypper install curl jq	        #openSUSE
			echo "#----------------------------Instalado Requisitos Obligatorios-----------------------------#"
			clear
			;; 

		salir)

			break;; 

		*)
			echo "$REPLY opción inválida"
			;; 

	esac 

done

}

function menu(){
PS3="Elige lo que quieres hacer: "

select opt in salir IP-Personal IP-Otro; do
	case $opt in 

		IP-Personal)
			echo "#----------------------------Obteniendo Dirección / IP Personal-----------------------------#"
			sleep 2s
			verificaip
			youip
			echo "#----------------------------Dirección / IP Personal Obtenida-----------------------------#"
			;; 

		IP-Otro)
			echo "#----------------------------Obteniendo Dirección / IP-----------------------------#"
			sleep 2s
			verificaip
			direccionip
			echo "#----------------------------Dirección / IP Obtenida-----------------------------#"
			;; 

		salir)
			break;; 

		*)
			echo "$REPLY opción inválida"
			;; 

	esac 

done

}

			chiguire
			clear
			encabezado
			clear
			diestro
			clear
			menu