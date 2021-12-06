#!/bin/bash

LOGS=/home/logs

if ping -c 1 -W 1 "192.168.20.253"; then

  if [ -d "$LOGS" ]; then 
  rsync -avz --delete --progress --times --exclude=/cache -e ssh /home/  bakap@192.168.20.253:/media/disco_backups -v > /home/logs/backup_home_cliente-03.sh_$(date +%Y-%m-%d_%H-%M-%S).log

  else
  mkdir /home/logs;
  rsync -avz --delete --progress --times --exclude=/cache -e ssh /home/  bakap@192.168.20.253:/media/disco_backups -v > /home/logs/backup_home_cliente-03.sh_$(date +%Y-%m-%d_%H-%M-%S).log
  fi

else
 echo "el servidor esta .253 esta apagado"

fi
exit 0







