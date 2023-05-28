#!/bin/bash

# Obtener la versión del kernel actual y la versión más antigua
current_kernel=$(uname -r)
oldest_kernel=$(rpm -q --queryformat="%{VERSION}-%{RELEASE}.%{ARCH}\n" kernel | sort -V | head -n 1)

# Eliminar todos los kernels excepto el más antiguo y el más reciente
sudo dnf remove -y $(dnf repoquery --installonly --latest-limit=-2 -q | grep -v "^kernel-$current_kernel\|^kernel-$oldest_kernel")

# Limpiar todo lo que se ha eliminado
sudo dnf autoremove -y

# Obtener la lista de kernels instalados
kernel_list=$(rpm -qa kernel-devel | sort -V)

# Descargar los kernel headers de cada kernel instalado
for kernel in $kernel_list
do
    sudo dnf download kernel-devel-$kernel kernel-headers-$kernel
done