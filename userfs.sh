#!/bin/bash

users=$(ps -eo user,uid | awk '$2 >= 1000 {print $1}' | grep -v "USER" | sort -u)

for user in $users
do
  if [ ! -d "$user" ]; then
    mkdir "$user"
  fi

  ps -u "$user" -o pid,comm,time > "$user/procs"

done
