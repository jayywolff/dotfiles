#!/bin/bash

if [[ $(pulsemixer --list-sources | grep 'Mute: 1') ]]; then
    echo "  muted "
else
    echo ''
fi
