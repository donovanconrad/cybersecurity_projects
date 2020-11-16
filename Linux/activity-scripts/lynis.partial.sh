#!/bin/bash

sudo lynis audit --tests-from-group authentication,networking,storage,filesystems --quiet --logfile /tmp/lynis.partial_scan.log

