#!/usr/bin/env bash

set -eu

QUERY_FILES=/queries/*.js
for QUERY_FILE in $QUERY_FILES
do
    QUERY_FILE=$(basename "$QUERY_FILE")
    QUERY_NAME=$(basename "$QUERY_FILE" ".js")

    # run the query. The query needs to output its results to a collection that
    # have the same name as the file
    mongo --quiet logs < "/queries/$QUERY_FILE"

    # export results from previous query to a csv
    mongoexport \
        -d logs \
        -c "$QUERY_NAME" \
        --fieldFile "/queries/$QUERY_NAME-fields.txt" \
        --type=csv \
        --out "/queries/results/$QUERY_NAME.csv"

    # drop the result collection
    mongo logs --eval "db.getCollection('$QUERY_NAME').drop()"
done
