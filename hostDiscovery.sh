#!/bin/bash 

function ctrl_c(){
  echo -e "\n\n[!] Saliendo..."
  tput cnorm; exit 1
}

trap ctrl_c INT

## Vamos a crear primero una herramienta básica (para máscara /24), posteriormente la modificaré para tener en cuenta el resto de máscaras
tput civis
for i in $(seq 1 254); do 
  timeout 1 bash -c "ping -c 1 192.168.0.$i" &>/dev/null && echo -e "[+] Host 192.168.0.$i - ACTIVE" & 
done
wait;
tput cnorm 
