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

     if [ -e "radacina/$user/lastlogin" ]; then
        rm "radacina/$user/lastlogin"
     fi

  done

  for numedirector in $(ls radacina)
  do
    if  ! echo "$users" | grep -q "^${numedirector}$" ; then
       >  "radacina/$numedirector/procs"
       last "$numedirector" | head -n 1 |awk '{print $3, $4, $5, $6}' >  "radacina/$numedirector/lastlogin"
    fi
  done

  sleep 10
  echo Verificam ......
done
