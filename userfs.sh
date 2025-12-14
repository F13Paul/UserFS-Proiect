#!/bin/bash

users=$(ps -eo user,uid | awk '$2 >= 1000 {print $1}' | grep -v "USER" | sort -u)

echo "Lista utilizatori activi si procesele acestora: "

for user in $users
do
  echo "Utilizatorul este $user"
  echo "Procesele rulate de $user: "
  ps -u "$user" -o pid,comm,time

done
