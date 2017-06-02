#!/usr/bin/env bash

cd pandoc
firefox site/index.html &
sleep 1
http-server &
watch -n 10 'bash script.sh'
