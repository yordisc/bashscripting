#!/bin/bash

# Función para imprimir el mensaje de estado
function print_status {
  if [[ $1 == "activo" ]]; then
    echo -e "\e[32mEstado: activo\e[0m"
  elif [[ $1 == "leyendo" ]]; then
    echo -e "\e[33mEstado: leyendo\e[0m"
  else
    echo -e "\e[31mEstado: error\e[0m"
  fi
}

# Listar los dispositivos de entrada de audio disponibles y mostrarlos como un menú
echo "Dispositivos de entrada de audio disponibles:"
devices=($(arecord -l | grep -E '^card [0-9]+:' | awk '{print $2" "$3}' | uniq))
for i in "${!devices[@]}"; do
  echo "$i. ${devices[$i]}"
done

# Bucle para pedir al usuario que seleccione un dispositivo de entrada de audio
while true; do
  echo -n "Introduce el número de dispositivo de entrada de audio que deseas utilizar: "
  read device_number
  if [[ $device_number -ge 0 && $device_number -lt ${#devices[@]} ]]; then
    break
  else
    echo "Número de dispositivo inválido"
  fi
done

# Obtener el nombre del dispositivo de entrada de audio seleccionado
device_name=$(arecord -l | grep -m 1 "${devices[$device_number]}" | awk '{print $2}')
device_id=$(arecord -l | grep -m 1 "${devices[$device_number]}" | awk -F '[:.]' '{print $2"_"$4}')

# Bucle para mostrar el menú de opciones
status="desactivado"
while true; do
  clear
  echo "Menú de opciones:"
  echo "1. Activar escucha del micrófono"
  echo "2. Desactivar escucha del micrófono"
  echo "3. Salir"
  echo ""
  print_status $status
  echo ""
  echo -n "Introduce el número de opción que deseas seleccionar: "
  read choice

  case $choice in
    1)
      if [[ $status != "activo" ]]; then
        # Activar la escucha del micrófono
        status="leyendo"
        (parec -d "alsa_input.pci-0000_00_1b.0.analog-stereo" | pacat) &
        sleep 0.5
        status="activo"
      fi
      ;;
    2)
      if [[ $status == "activo" ]]; then
        # Desactivar la escucha del micrófono
        status="desactivando"
        pkill parec
        sleep 0.5
        status="desactivado"
      fi
      ;;
    3)
      # Salir del programa
      if [[ $status != "desactivado" ]]; then
        pkill parec
      fi
      exit 0
      ;;
    *)
      echo "Opción inválida"
      sleep 1
      ;;
  esac
done
