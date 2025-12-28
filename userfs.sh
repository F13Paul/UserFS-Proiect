#!/bin/bash

if [ ! -d "radacina" ]; then
    mkdir "radacina"
fi

while true
do

  users=$(ps -eo user,uid | awk '$2 >= 1000 {print $1}' | grep -v "USER" | sort -u)

  for user in $users
  do
     if [ ! -d "radacina/$user" ]; then
         mkdir "radacina/$user"
      fi

      ps -u "$user" -o pid,comm,time > "radacina/$user/procs"

  done
  echo "Merge?"
  sleep 10

done
