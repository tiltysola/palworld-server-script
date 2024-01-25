#!/bin/bash
####################################
#
# PalWorld server-side auto backup script.
# WARNING: PalWorld server should be running at port 8211
#
# Ubuntu users should install net-tools first:
# $ (suto) apt install net-tools
#
# You could create a cron job by the following command
# $ (sudo) crontab -e
# */10 * * * * '${Your_Server_Path}/Backup.sh'
#
####################################

GAME_PORT=8211

GAME_PATH=$(cd "$(dirname "$0")";pwd)
SAVE_PATH="${GAME_PATH}/Pal/Saved"
DEST_PATH="${GAME_PATH}/Backups"
DEST_FILENAME="PalSave-$(date +%F_%H-%M-%S).tar.gz"

if [ ! -d ${SAVE_PATH} ]
then
  echo "Please put this script in PalWorld server folder."
  exit
fi

echo "Found PalWorld saves in ${SAVE_PATH}"

GAME_PID=`netstat -nlp | grep $GAME_PORT | awk '{print $6}' | awk -F / '{print $1}'`

if [ ! $GAME_PID ]
then
  echo "PalWorld server is not running, backup abandoned."
  exit
fi

echo "PalWorld server is running with pid ${GAME_PID}"

if [ ! -d ${DEST_PATH} ]
then
  mkdir -p ${DEST_PATH}
fi

echo "Backing up saves to ${DEST_PATH}/${DEST_FILENAME}"

tar czf $DEST_PATH/$DEST_FILENAME -C "${SAVE_PATH}/../" Saved

echo "Backup finished."
