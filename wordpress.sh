			echo Instalar wordpress
			sudo rm -rf /tmp/dis/latest*
			sudo rm -rf /opt/lampp/htdocs/wordpress
			cd /tmp/dis
			wget https://wordpress.org/latest.zip
			sudo unzip -d /opt/lampp/htdocs ./latest.zip
			# Permisos de Servidor
			sudo groupadd ftp
			usermod -a -G xamppusers $USER
			cd /opt/lampp
			sudo chown root.ftp htdocs
			sudo chmod -R 777 htdocs
			#sudo echo "define( 'FS_METHOD','direct');" >> /opt/lampp/htdocs/wordpress/wp-config.php
			cd $HOME