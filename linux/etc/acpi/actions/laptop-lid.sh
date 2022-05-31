#!/bin/bash

# from https://serverfault.com/a/310104
addtimestamp() {
    while IFS= read -r line; do
        printf '%s: %s\n' "$(date)" "$line";
    done
}

# from https://unix.stackexchange.com/a/678610
lock=$HOME/fprint-disabled
msg=""
{
    if grep -Fq closed /proc/acpi/button/lid/LID0/state
    then
      touch "$lock"
      systemctl stop fprintd
      systemctl mask fprintd
      msg="stopped fprint"
    elif [ -f "$lock" ]
    then
      systemctl unmask fprintd
      systemctl start fprintd
      rm "$lock"
      msg="started fprint"
    else
      msg="did nothing (state not matched)"
    fi
    echo $msg
} | addtimestamp &>> /var/log/laptop-lid.log
