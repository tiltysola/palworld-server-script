#!/bin/bash
####################################
#
# PalWorld server-side start script.
# 
####################################

WAIT=10

while expr $WAIT \>= 0 > /dev/null
do
  echo "Server will start in ${WAIT} seconds..."
  sleep 1
  ((WAIT--))
done

./PalServer.sh -useperfthreads -NoAsyncLoadingThread -UseMultithreadForDS
