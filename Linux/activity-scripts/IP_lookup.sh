#!/bin/bash

curl -s http://ipinfo.io/$1 | grep country |awk -F\" '{print $4}'
