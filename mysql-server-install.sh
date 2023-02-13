#!/bin/bash 
FECHA=$(date +"%Y-%m-%d")

function mysqlconfig()

{
			sudo systemctl start mysqld
			sudo systemctl enable mysqld
			sudo grep 'A temporary password' /var/log/mysqld.log |tail -1
			sudo firewall-cmd --add-service=mysql --permanent
			sudo firewall-cmd --reload

} 

function chiguire()

{
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

}

		clear
		chiguire
			sleep 2s
		clear

		echo "https://github.com/yordisc/"
		echo " "
		echo " "
		echo "##############################"
		echo "# Instalador de MySQL-Server #"
		echo "##############################"
		echo " "
		echo " "

PS3="Elige tu diestro de linux: " 

select opt in debian fedora arch salir; 

do 

	case $opt in 

		debian)
			read -p "Escribe la versión: " version
			read -p "Escribe el año: " age
		
version='22.04'
age='2022'
### Desinstalar
sudo rm -rf /etc/mysql /var/lib/mysql
sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get purge mysql-server
sudo apt-get autoremove
sudo apt-get autoclean
###
			echo "#----------------------------Instalando MySQL-server-----------------------------#"
			sleep 2s
cd ~
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/$version/mssql-server-$age.list)"
sudo apt update
sudo apt install -y mssql-server
sudo apt clean && sudo apt autoclean
sudo /opt/mssql/bin/mssql-conf setup
mysqlconfig
			echo "#----------------------------Instalado MySQL-server-----------------------------#"
			;; 

		fedora)
			sudo rm -rf /etc/mysql /var/lib/mysql
			echo "#----------------------------Instalando MySQL-server-----------------------------#"
			sleep 2s
			sudo yum update
			sudo yum install -y community-mysql-server
			mysqlconfig
			echo "#----------------------------Instalado MySQL-server-----------------------------#"
			;; 

		arch)
			echo "#----------------------------Instalando MySQL-server-----------------------------#"
			sleep 2s
			sudo rm -rf /etc/mysql /var/lib/mysql
			sudo pacman -Syu
			sudo pacman -S mysql
			mysqlconfig
			echo "#----------------------------Instalado MySQL-server-----------------------------#"
			;; 

		salir) 

			break;; 

		*)
			echo "$REPLY opción inválida"
			;; 

	esac 

done