#!/bin/bash
echo "HI! LISTENING ON" ${1} ${2}
mkdir /downloads
socat tcp-listen:${1},fork tcp:localhost:9222 &
(cd /downloads && python3 -m http.server ${2}) &
echo "1ST"
(google-chrome --start-maximized --remote-debugging-port=9222 --no-sandbox --user-data-dir=/userdata/ http://127.0.0.1:9222) &
sleep 3
kill %2
echo "2ND"
python3 /app/fix_profile.py
(google-chrome --start-maximized --remote-debugging-port=9222 --no-sandbox --user-data-dir=/userdata/ http://127.0.0.1:9222) &
# # google-chrome-unstable --start-maximized --remote-debugging-port=9223 --disable-gpu http://127.0.0.1:9223 &
sleep 3
echo "STAT"
curl 127.0.0.1:9222/json/list
echo "WAIT"
sleep 14400
# google-chrome-unstable --disable-gpu --no-sandbox --log-level=TRACE http://127.0.0.1:9223/
# curl 127.0.0.1:9223/json/list
# netstat -anp | grep 92
# ps -ef | grep root
# python3 getter.py