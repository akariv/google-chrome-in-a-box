#!/bin/bash
# /etc/init.d/dbus start
PORT=${1:-"9223"}
DOWNLOADS_PORT=${2:-"9224"}
INITIAL=${3:-"https://data.gov.il"}
xvfb-run -s "-screen 0 1200x900x24" /bin/bash -c "/app/startup.sh $PORT $DOWNLOADS_PORT $INITIAL"