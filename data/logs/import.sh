#!/usr/bin/env bash

set -eu

LOG_FILES=/logs/*.log
for LOG_FILE in $LOG_FILES
do
    mongoimport -d logs -c kong --type=json --file "$LOG_FILE"
done
