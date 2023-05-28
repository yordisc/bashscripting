#!/bin/bash
# Descarga VMware Player
wget https://download3.vmware.com/software/WKST-PLAYER-1702/VMware-Player-Full-17.0.2-21581411.x86_64.bundle

# Cambia los permisos del archivo descargado
chmod +x VMware-Player-Full-17.0.2-21581411.x86_64.bundle

# Instala VMware Player
sudo ./VMware-Player-Full-17.0.2-21581411.x86_64.bundle --console --eulas-agreed