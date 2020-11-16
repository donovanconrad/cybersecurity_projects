#!/bin/bash


sed s/INCORRECT_PASSWORD/ACCESS_DENIED/ $1 > $2


awk -F" "  '{print $4, $6}' $2 > $3

