#!/bin/bash

if [[ $(pulsemixer --list-sources | grep 'Mute: 1') ]]; then
    echo ''
else
    echo "  Recording "
fi
