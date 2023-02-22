			echo Instalar wordpress
			sudo rm -rf /tmp/dis/latest*
			sudo rm -rf /opt/lampp/htdocs/wordpress
			cd /tmp/dis
			wget https://wordpress.org/latest.zip
			sudo unzip -d /opt/lampp/htdocs ./latest.zip
			cd $HOME