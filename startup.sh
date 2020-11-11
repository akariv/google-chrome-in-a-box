#!/bin/bash
echo "HI! LISTENING ON" ${1} ${2}
echo "SCREENSHOT http://tzabar.obudget.org:${2}/screenshot"
echo "INITIAL PAGE" ${3}
USER_AGENT='Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36 datagov-external-client'
mkdir /downloads
(cd /downloads && python3 /app/server.py ${2}) &
echo "1ST"
(google-chrome --start-maximized --remote-debugging-port=9222 --no-sandbox --user-data-dir=/userdata/ --disable-features=TranslateUI --user-agent="$USER_AGENT" ${3}) &
sleep 30
find /userdata/
kill %2
echo "2ND"
socat tcp-listen:${1},fork tcp:localhost:19222 &
python3 /app/fix_profile.py
(google-chrome --start-maximized --remote-debugging-port=19222 --no-sandbox --user-data-dir=/userdata/ --disable-features=TranslateUI --user-agent="$USER_AGENT" ${3}) &
sleep 3
echo "STAT"
curl 127.0.0.1:9222/json/list
echo "WAIT"
sleep 14400
