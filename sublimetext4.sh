#!/bin/bash

# Función para mostrar un mensaje en color
function show_message() {
    case $2 in
        red)
            echo -e "\e[1;31m$1\e[0m"
            ;;
        green)
            echo -e "\e[1;32m$1\e[0m"
            ;;
        yellow)
            echo -e "\e[1;33m$1\e[0m"
            ;;
        *)
            echo $1
            ;;
    esac
}

# Función para descargar e instalar Sublime Text en Debian
function install_sublime_debian() {
    show_message "Descargando clave pública..." "yellow"
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
    if [ $? -ne 0 ]; then
        show_message "Error al descargar clave pública" "red"
        exit 1
    fi
    show_message "Descarga completada" "green"

    show_message "Selecciona el canal a usar:" "yellow"
    options=("Stable" "Dev")
    select opt in "${options[@]}"
    do
        case $opt in
            "Stable")
                repository="https://download.sublimetext.com/ apt/stable/"
                break
                ;;
            "Dev")
                repository="https://download.sublimetext.com/ apt/dev/"
                break
                ;;
            *) 
                show_message "Opción inválida" "red"
                ;;
        esac
    done

    show_message "Agregando repositorio..." "yellow"
    echo "deb $repository" | sudo tee /etc/apt/sources.list.d/sublime-text.list > /dev/null
    if [ $? -ne 0 ]; then
        show_message "Error al agregar repositorio" "red"
        exit 1
    fi
    show_message "Repositorio agregado correctamente" "green"

    show_message "Actualizando fuentes de apt..." "yellow"
    sudo apt-get update > /dev/null
    if [ $? -ne 0 ]; then
        show_message "Error al actualizar fuentes de apt" "red"
        exit 1
    fi
    show_message "Fuentes de apt actualizadas correctamente" "green"

    show_message "Instalando Sublime Text..." "yellow"
    sudo apt-get install sublime-text -y > /dev/null
    if [ $? -ne 0 ]; then
        show_message "Error al instalar Sublime Text" "red"
        exit 1
    fi
    show_message "Sublime Text instalado correctamente" "green"
}

# Función para descargar e instalar Sublime Text en Fedora
function install_sublime_fedora() {
    show_message "Descargando clave pública..." "yellow"
    sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg > /dev/null
    if [ $? -ne 0 ]; then
        show_message "Error al descargar clave pública" "red"
        exit 1
    fi
    show_message "Descarga completada" "green"

    show_message "Selecciona el canal a usar:" "yellow"
    options=("Stable" "Dev")
    select opt in "${options[@]}"
    do
        case $opt in
            "Stable")
                repository="https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo"
                break
                ;;
            "Dev")
                repository="https://download.sublimetext.com/rpm/dev/x86_64/sublime-text.repo"
                break
                ;;
            *) 
                show_message "Opción inválida" "red"
                ;;
        esac
    done

    show_message "Agregando repositorio..." "yellow"
    sudo dnf config-manager --add-repo $repository > /dev/null
    if [ $? -ne 0 ]; then
        show_message "Error al agregar repositorio" "red"
        exit 1
    fi
    show_message "Repositorio agregado correctamente" "green"

    show_message "Actualizando fuentes de dnf..." "yellow"
    sudo dnf check-update > /dev/null
    if [ $? -ne 0 ]; then
        show_message "Error al actualizar fuentes de dnf" "red"
        exit 1
    fi
    show_message "Fuentes de dnf actualizadas correctamente" "green"

    show_message "Instalando Sublime Text..." "yellow"
    sudo dnf install sublime-text -y > /dev/null
    if [ $? -ne 0 ]; then
        show_message "Error al instalar Sublime Text" "red"
        exit 1
    fi
    show_message "Sublime Text instalado correctamente" "green"
}

# Función para descargar e instalar Sublime Text en Arch Linux
function install_sublime_arch() {
    show_message "Descargando clave pública..." "yellow"
    curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
    if [ $? -ne 0 ]; then
        show_message "Error al descargar clave pública" "red"
        exit 1
    fi
    show_message "Descarga completada" "green"

    show_message "Añadiendo repositorio de Sublime Text..." "yellow"
    echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
    if [ $? -ne 0 ]; then
        show_message "Error al añadir repositorio de Sublime Text" "red"
        exit 1
    fi
    show_message "Repositorio añadido correctamente" "green"

    show_message "Actualizando paquetes..." "yellow"
    sudo pacman -Syu
    if [ $? -ne 0 ]; then
        show_message "Error al actualizar paquetes" "red"
        exit 1
    fi
    show_message "Actualización completada" "green"

    show_message "Instalando Sublime Text..." "yellow"
    sudo pacman -S sublime-text
    if [ $? -ne 0 ]; then
        show_message "Error al instalar Sublime Text" "red"
        exit 1
    fi
    show_message "Sublime Text instalado correctamente" "green"
}

# Menú para seleccionar la distribución
echo "Selecciona tu distribución:"
echo "1. Debian"
echo "2. Fedora"
echo "3. Arch"
read -p "Introduce el número de tu distribución: " distro

# Instalar Sublime Text en función de la distribución seleccionada
case $distro in
    "1")
        install_sublime_debian
        ;;
    "2")
        install_sublime_fedora
        ;;
    "3")
        install_sublime_arch
        ;;
    *)
        echo "Distribución no soportada"
        exit 1
        ;;
esac