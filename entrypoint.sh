#!/bin/bash
# /etc/init.d/dbus start
xvfb-run -s "-screen 0 1200x900x24" /bin/bash -c /app/startup.sh