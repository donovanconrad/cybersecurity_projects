#!/bin/bash

sudo tar cf /var/backup/home.tar /home  >/dev/null 2>&1

mv /var/backup/home.tar /var/backup/home`date +%m-%d-%Y`.tar

ls -alh /var/backup > /var/backup/file_report.txt

free -h > /var/backup/disk_report.txt
