#!/bin/bash

ps -el | awk '/pts/||$8~/35/{printf("%5d %5d %s\n", $4, $5, $14)}'
