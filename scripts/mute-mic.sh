#!/bin/bash

OPTION=${1:---toggle-mute}    
MICS=$(pulsemixer --list-sources | grep 'Source:')
if [ -n "$MICS" ]
then

    while IFS= read -r line; do
        echo "line: $line"
        ID=$(echo $line | awk '{print $3}' | sed 's/.$//')
        echo "Id: $ID"
        pulsemixer --id $ID $OPTION
    done <<< "$MICS"
fi


