#!/usr/bin/env bash

cd pandoc
firefox site/index.html &
sleep 1
watch 'bash script.sh' -n 5
