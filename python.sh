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
			echo -e "\033[34m##############################"
			echo -e "\033[34m# Instalar versión de Python #"
			echo -e "\033[34m##############################"
			echo " "
			echo " "
			sleep 2s
		clear

}		


function version()

{

Xversion="3.10.1"
			echo "elige la versión de Python (version actual: $Xversion)"
read number
while ! [[ $number =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || [ "$number" -lt 1 ]; do
  echo "El valor introducido no es válido. Por favor, introduzca un número valido o tomara la versión $Xversion."
  read number
  if [[ -z "$number" ]]; then
    number="$Xversion"
  fi
done
    Xversion="$number"
			echo "elegiste la versión de Python: ($Xversion)"
		sleep 2s
		clear


}


function installpy()

{
		clear
			echo -e "\033[32mIniciando..."
			sleep 2s

### Instalador de Python

    pyversion="$Xversion"
cd ~
rm -r pyth0ninst6ll
mkdir pyth0ninst6ll
sudo chmod -R 777 pyth0ninst6ll
sudo chown -R $USER pyth0ninst6ll
cd pyth0ninst6ll
wget https://www.python.org/ftp/python/$pyversion/Python-$pyversion.tgz
tar xvf Python-$pyversion.tgz$ cd Python-$pyversion
./configure --enable-optimizations --with-ensurepip=install
make -j 8
sudo make altinstall
cd ~
rm -r pyth0ninst6ll
			echo -e "\033[32m#----------------------------Versión de Python Instalado-----------------------------#"
}



##### Inicio del programa ######


			fabricante
			chiguire
			inicio
			version
			installpy
			chiguire
			fabricante
