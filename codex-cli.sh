#!/bin/bash 
### Hecho por Yordis Cujar

FECHA=$(date +"%Y-%m-%d")

# https://github.com/microsoft/Codex-CLI
## Once configured for your shell of preference, you can use the Codex CLI by writing a comment (starting with #) into your shell, and then hitting Ctrl + G.


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
			echo -e "\033[34m##### Instalar Codex-CLI #####"
			echo -e "\033[34m##############################"
			echo " "
						sleep 2s
		clear
			echo " Antes de instalar ten a la mano el ORG-ID / API-KEY / Engine ID "
			echo " Mas información en: https://github.com/microsoft/Codex-CLI"
			sleep 2s
		clear

}		


function correccion()

{
 ## Modificacion eliminando de la linea 46 eliminando ''
sudo chmod -R 777 $HOME/.codex-cli/scripts/zsh_setup.sh
sudo sed -i "46s/ '' '/ '/g" zsh_setup.sh

}


function installcodex()

{
		clear
			echo -e "\033[32mIniciando..."
			sleep 2s
			### Requerimientos
			pip uninstall openai
			pip install --upgrade pip
			pip install openai
			### OpenIA-terminal ###
			cd
			rm -r $HOME/.codex-cli
			mkdir $HOME/.codex-cli
			sudo chmod -R 777 $HOME/.codex-cli
			sudo chown -R $USER $HOME/.codex-cli
			git clone https://github.com/microsoft/Codex-CLI.git $HOME/.codex-cli
			cd $HOME/.codex-cli/scripts
			###
			correccion
			###
			./zsh_setup.sh
			### ./zsh_cleanup.sh
## ORG-ID
## Modelo
## API-KEY
			echo -e "\033[32m#----------------------------Instalado Codex-cli (ChatGPT para terminal)-----------------------------#"
			echo -e "\033[32m#----------------------------Para usar solo escribe algo comentado ( # ) y luego usa Ctrl + G.-------#"
						sleep 2s
}


##### Inicio del programa ######
			fabricante
			chiguire
			inicio
			installcodex
			chiguire
			fabricante