#!/bin/bash
docker build . -t akariv/google-chrome-in-a-box --cache-from akariv/google-chrome-in-a-box
docker push akariv/google-chrome-in-a-box