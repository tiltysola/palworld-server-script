#!/bin/bash
####################################
#
# PalWorld server-side auto restart script.
# WARNING: PalWorld server should be running at port 8211
#
# Ubuntu users should install net-tools first:
# $ (suto) apt install net-tools
#
# You could create a cron job by the following command
# $ (sudo) crontab -e
# */1 * * * * '${Your_Server_Path}/Restart.sh'
#
####################################

GAME_PORT=8211
RAM_MIN_LIMIT=1024

GAME_PID=`netstat -nlp | grep $GAME_PORT | awk '{print $6}' | awk -F / '{print $1}'`
RAM_FREE_CUR=`free -m | grep "Mem:" | awk '{print $4}'`

echo "PalWorld server is running with pid ${GAME_PID}"
echo "Current free ram is ${RAM_FREE_CUR} / ${RAM_MIN_LIMIT}"

if expr $RAM_FREE_CUR \<= $RAM_MIN_LIMIT > /dev/null
then
  echo "OUT_OF_MEMORY risk detected,"
  WAIT=3
  while expr $WAIT \>= 0 > /dev/null
  do
    echo "Server will shutdown in ${WAIT} seconds..."
    sleep 1
    ((WAIT--))
  done
  kill -15 $pid
  sleep 10
  kill -9 $pid
fi
