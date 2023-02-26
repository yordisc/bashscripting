#!/bin/bash
# Hecho por Yordis Cujar
# Version 1

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
			echo -e "\033[34m#######################################"
			echo -e "\033[34m# Instalador de PhpMyAdmin para XAMPP #"
			echo -e "\033[34m#######################################"
			echo " "
			echo " "
			sleep 2s
		clear

}	


function version()

{

Xversion="5.2.1"
			echo "elige la versión de PhpMyAdmin"
read number
while ! [[ $number =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || [ "$number" -lt 1 ]; do
  echo "El valor introducido no es válido. Por favor, introduzca un número valido o tomara la versión $Xversion."
  read number
  if [[ -z "$number" ]]; then
    number="$Xversion"
  fi
done
    Xversion="$number"
			echo "elegiste la versión de PhpMyAdmin: ($Xversion)"
		sleep 2s
		clear


}


function phpmyadmin()

{
    phpmyadminversion="$Xversion"
		### PhpMyAdmin
			sudo mv /opt/lampp/phpmyadmin/config.inc.php /opt/
			cd
			wget -O phpmyadmin.zip https://files.phpmyadmin.net/phpMyAdmin/$phpmyadminversion/phpMyAdmin-$phpmyadminversion-all-languages.zip
			unzip phpmyadmin.zip
			rm phpmyadmin.zip
			mv phpMyAdmin* phpmyadmin
			sudo chmod 777 /opt/lampp/phpmyadmin
			sudo rm -r /opt/lampp/phpmyadmin
			sudo mv phpmyadmin /opt/lampp/
			sudo mv /opt/config.inc.php /opt/lampp/phpmyadmin
			sudo chmod 755 /opt/lampp/phpmyadmin
			sudo mkdir /opt/lampp/phpmyadmin/tmp/
			sudo chmod 777 /opt/lampp/phpmyadmin/tmp/
			cd
		clear
		echo "Instalado PhpMyAdmin"
}	


			fabricante
			chiguire
			inicio
			version
			phpmyadmin
			chiguire
			fabricante

