#!/bin/bash
echo "HI! LISTENING ON" ${1}
mkdir /downloads
socat tcp-listen:${1},fork tcp:localhost:9222 &
echo "1ST"
(google-chrome --start-maximized --remote-debugging-port=9222 --no-sandbox http://127.0.0.1:9222) &
sleep 3
kill %2
echo "2ND"
(google-chrome --start-maximized --remote-debugging-port=9222 --no-sandbox http://127.0.0.1:9222) &
# # google-chrome-unstable --start-maximized --remote-debugging-port=9223 --disable-gpu http://127.0.0.1:9223 &
sleep 3
echo "STAT"
curl 127.0.0.1:9222/json/list
echo "WAIT"
while true ; do sleep 10; done
# google-chrome-unstable --disable-gpu --no-sandbox --log-level=TRACE http://127.0.0.1:9223/
# curl 127.0.0.1:9223/json/list
# netstat -anp | grep 92
# ps -ef | grep root
# python3 getter.py