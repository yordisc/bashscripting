#!/bin/bash

echo "¿Qué desea hacer?"
echo "1. Montar una unidad"
echo "2. Desmontar una unidad"
read opcion

### Opcion 1

if [ $opcion -eq 1 ]; then
  echo "Unidades no montadas:"
  lsblk -o NAME,FSTYPE -n | awk '{gsub("ntfs", "ntfs3"); print}'
  echo "Seleccione una unidad para montar:"
  read unidad
  tipo_archivo=$(lsblk -o FSTYPE -n /dev/$unidad)
  echo "Ingrese el punto de montaje para la unidad (por ejemplo, /mnt/montaje):"
  read punto_montaje

  # Obtener el UUID de la unidad seleccionada
  uuid=$(sudo blkid -s UUID -o value /dev/$unidad)

  # Agregar la entrada al archivo fstab
  echo "UUID=$uuid $punto_montaje $tipo_archivo defaults,uid=1000,gid=1000 0 0" | sudo tee -a /etc/fstab > /dev/nulll

  # Montar la unidad
  sudo mount -a

  echo "La unidad ha sido montada correctamenteen $punto_montaje"
fi

###Opcion 2

if [ $opcion -eq 2 ]; then
  echo "Unidades montadas:"
  mount | awk '$3 ~ /^\/mnt/ { print $1, $3 }'
  echo "Seleccione una unidad para desmontar:"
  read unidad

  # Eliminar la entrada del archivo fstab
 # Buscar la entrada en el archivo fstab y guardar la línea en una variable
  linea=$(grep "/dev/$unidad" /etc/fstab)

  # Eliminar la línea del archivo fstab
  sudo sed -i "/$linea/d" /etc/fstab

  # Desmontar la unidad
  sudo umount /mnt/$unidad

  echo "La unidad ha sido desmontada correctamente"
fi