#!/usr/bin/env bash

if [ $# -eq 0 ]; then
  echo "comando mal ejecutado"
  exit 2
fi

if ! [[ "$1" =~ ^(him|her|it)$ ]]; then
  echo "el comando debe ser completo con el genero"
  exit 2
fi

if [[ -z "$2" ]]; then
  echo "debes poner el nombre de la app a matar"
  exit 2
else
  clear
  PIDPROC=$(ps -fea| egrep -v 'finish|him|it|her|grep'| grep -i "$2"| awk '{print $2}')
  if [ -z "$PIDPROC" ]; then
    for i in "${PIDPROC[@]}"; do
      kill -9 $i
    done
    echo -e "
    _______  _______ _________ _______  _       __________________
    (  ____ \(  ___  )\__   __/(  ___  )( \      \__   __/\__   __/|\     /|
    | (    \/| (   ) |   ) (   | (   ) || (         ) (      ) (   ( \   / )
    | (__    | (___) |   | |   | (___) || |         | |      | |    \ (_) /
    |  __)   |  ___  |   | |   |  ___  || |         | |      | |     \   /
    | (      | (   ) |   | |   | (   ) || |         | |      | |      ) (
    | )      | )   ( |   | |   | )   ( || (____/\___) (___   | |      | |
    |/       |/     \|   )_(   |/     \|(_______/\_______/   )_(      \_/
    "
  else
    echo "MENSAJE: primero asegurate que este valido"
  fi
  exit 0
fi
