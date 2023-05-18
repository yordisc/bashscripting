#!/bin/bash

### Variables

menufile="/usr/share/applications/podmandesktop.desktop"
debpk="apt-get install"
rpmpk="dnf install"
archpk="pacman -S"
distro=""

### Funciones

function print_yellow {
  echo -e "\e[33m$1\e[0m"
}

function print_green {
  echo -e "\e[32m$1\e[0m"
}

function print_red {
  echo -e "\e[31m$1\e[0m"
}

function install_requisitos {
  print_yellow "Instalando requisitos..."
  case "$distro" in
    "debian")
      sudo apt-get update
      sudo apt-get install docker podman -y
      ;;
    "fedora")
      sudo dnf update
      sudo dnf install docker podman -y
      ;;
    "arch")
      sudo pacman -Syu
      sudo pacman -S docker podman -y
      ;;
    *)
      print_red "Error: distribución no soportada"
      exit 1
      ;;
  esac
  print_green "Requisitos instalados con éxito"
}

function install_flatpak {
  print_yellow "Instalando Flatpak..."
  case "$distro" in
    "debian")
      sudo apt-get update
      sudo apt-get install flatpak -y
      ;;
    "fedora")
      sudo dnf update
      sudo dnf install flatpak -y
      ;;
    "arch")
      sudo pacman -Syu
      sudo pacman -S flatpak -y
      ;;
    *)
      print_red "Error: distribución no soportada"
      exit 1
      ;;
  esac
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak install flathub org.freedesktop.Platform/x86_64/$flatpakversion
  print_green "Flatpak instalado con éxito"
}

function update_flatpak {
  print_yellow "Actualizando Flatpak..."
  flatpak update --user flathub
  print_green "Flatpak actualizado con éxito"
}

function install_podman_desktop {
  print_yellow "Instalando Podman Desktop..."
  flatpak install --user flathub io.podman_desktop.PodmanDesktop/$desktopversion
  print_green "Podman Desktop instalado con éxito"
}

function update_podman_desktop {
  print_yellow "Actualizando Podman Desktop..."
  flatpak update --user io.podman_desktop.PodmanDesktop
  print_green "Podman Desktop actualizado con éxito"
}

function installpodmandesktopmanually {
	### Install manually
cd ~
wget https://github.com/containers/podman-desktop/releases/download/v$desktopversion/podman-desktop-$desktopversion.flatpak
flatpak install podman-desktop-$desktopversion.flatpak
rm podman-desktop-$desktopversion.flatpak
}

function generate_menu {
  print_yellow "Generando menú..."
  echo "[Desktop Entry]
Name=Podman Desktop
Comment=Desktop application for managing Podman containers
Exec=flatpak run io.podman_desktop.PodmanDesktop
Icon=io.podman_desktop.PodmanDesktop
Terminal=false
Type=Application
Categories=System;Utility;" | sudo tee $menufile > /dev/null
  print_green "Menú generado con éxito"
}

### Main

# Pedir distribución
while [[ ! "$distro" =~ ^(debian|fedora|arch)$ ]]; do
  read -p "Selecciona la distribución [debian/fedora/arch]: " distro
done

# Pedir versión de Flatpak
read -p "Ingresa la versión de Flatpak [$flatpakversion]: " input_flatpakversion
flatpakversion=${input_flatpakversion:-"22.08"}

# Pedir versión de Podman Desktop
read -p "Ingresa la versión de Podman Desktop [$desktopversion]: " input_desktopversion
desktopversion=${input_desktopversion:-"1.0.0"}

# Instalar requisitos
print_yellow "Instalando requisitos..."
install_requisitos || { print_red "Error al instalar requisitos"; exit 1; }
print_green "Requisitos instalados con éxito"

# Instalar Flatpak
print_yellow "Instalando Flatpak..."
install_flatpak || { print_red "Error al instalar Flatpak"; exit 1; }
print_green "Flatpak instalado con éxito"

# Instalar Podman Desktop
print_yellow "Instalando Podman Desktop desde Flathub..."
install_podman_desktop || { print_red "Error al instalar Podman Desktop"; exit 1; }
print_green "Podman Desktop instalado con éxito"

# Instalar Podman Desktop
print_yellow "Instalando Podman Desktop Manualmente..."
installpodmandesktopmanually || { print_red "Error al instalar Podman Desktop Manualmente"; exit 1; }
print_green "Podman Desktop instalado con éxito"

# Generar menú
print_yellow "Generando menú..."
generate_menu || { print_red "Error al generar menú"; exit 1; }
print_green "Menú generado con éxito"

# Actualizar índice de aplicaciones
print_yellow "Actualizando índice de aplicaciones..."
flatpak update --appstream || { print_red "Error al actualizar índice de aplicaciones"; exit 1; }
print_green "Índice de aplicaciones actualizado con éxito"

print_green "Podman Desktop ha sido instalado con éxito"