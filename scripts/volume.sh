#!/bin/bash

if [ $(pulsemixer --get-mute) -eq 1 ]
    then echo "婢 MUTE"
else
  echo " $(pulsemixer --get-volume | awk '{print $1}')%"
fi
