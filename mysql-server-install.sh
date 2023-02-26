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


function versionX()

{

version="22.04"
			echo "elige la versión de MySQL-server"
read numberv
while ! [[ $numberv =~ ^[0-9]+\.[0-9]+$ ]] || [ "$numberv" -lt 1 ]; do
  echo "El valor introducido no es válido. Por favor, introduzca un número valido o tomara la versión $version."
  read numberv
  if [[ -z "$numberv" ]]; then
    numberv="$version"
  fi
done
    version="$numberv"
			echo "elegiste la versión de MySQL-server: ($version)"
		sleep 2s
		clear


}

function yearversionX()

{


yearversion="2022"
			echo "elige el año de MySQL-server"
read number
while ! [[ $number =~ ^[0-9]{4}$ ]] || [ "$number" -lt 1 ]; do
  echo "El valor introducido no es válido. Por favor, introduzca un número valido o tomara la versión $yearversion."
  read number
  if [[ -z "$number" ]]; then
    number="$yearversion"
  fi
done
			yearversion="$number"
			echo "elegiste el año de MySQL-server: ($yearversion)"
		sleep 2s
		clear


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
			versionX
			yearversionX

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
wget -qO- https://packyearversions.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "$(wget -qO- https://packyearversions.microsoft.com/config/ubuntu/$version/mssql-server-$yearversion.list)"
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