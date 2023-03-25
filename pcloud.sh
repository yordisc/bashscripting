#!/bin/bash
# Hecho por Yordis Cujar
# Version 1


function installpcloud()

{
			echo "#--------------------------------Instalando PCloud--------------------------------#"
			sleep 1s
			cd ~
			sudo wget https://p-def1.pcloud.com/cBZucdpFlZm2d7RiZZZHxdYo7Z2ZZcaLZkZBYSsVZXpZEHZ7RZMzZMRZxpZ2RZYJZaRZYLZiJZl7Z9pZR5ZspqgVZ02yW60rDzrmuG3wwPi32GRiXUbP7/pcloud
			sudo mv pcloud /usr/bin/
			sudo chmod -R 755 /usr/bin/pcloud
			cd ~
			pcloud
			echo "#--------------------------------Instalado PCloud--------------------------------#"
			sleep 2s

}


			installpcloud