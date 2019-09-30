#!/bin/bash
# /etc/init.d/dbus start
PORT=${1:-"9223"}
xvfb-run -s "-screen 0 1200x900x24" /bin/bash -c "/app/startup.sh $PORT"