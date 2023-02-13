!/bin/bash
# Hecho por Yordis Cujar
# Version 1


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
		echo " "
		echo "Requiere tener instalado Snap"
			sleep 2s
		clear
		chiguire
		echo " "
		echo "https://github.com/yordisc/"
			sleep 2s
		clear



			echo "#----------------------------Instalando Workbench MySQL Community - Snap (Comenzando en 5 segundos)-----------------------------#"
			sleep 5s
# Desistalador
			sudo snap forget mysql --beta
			sudo snap remove mysql --beta
			sudo snap forget mysql-workbench-community
			sudo snap remove mysql-workbench-community
		clear
# Workbench sql community - snap
			sudo snap install mysql --beta
			sudo snap install mysql-workbench-community
			sudo sysctl kernel.unprivileged_userns_clone=1
# Agregar lanzadores snap
			sudo cp /var/lib/snapd/desktop/applications/* /usr/share/applications/
			echo "#----------------------------Instalado Workbench MySQL Community - Snap-----------------------------#"