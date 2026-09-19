#!/usr/bin/env bash

# Task 07: complete this script.
# Usage: ./scripts/analyze.sh FILE

# TODO: validate arguments
# TODO: validate file existence
# TODO: print:
# Total ERROR: <number>
# Top Code: <code>
if [ $# -ne 1 ];then
    echo "Usage: $0 FILE"
    exit 1
fi

if [ ! -f "$1" ];then
    echo "Error:FILE $1 does not exist"
    exit 1
fi

ERROR_COUNT=$(grep ERROR $1 | wc -l)
TOP_CODE=$(grep ERROR $1 | cut -d ' ' -f 5 | cut -d '=' -f 2 | sort | uniq -c | sort -nr | head -n1 | tr -s ' ' | cut -d ' ' -f 3)

echo "Total ERROR: $ERROR_COUNT"
echo "Top Code: $TOP_CODE"