#!/bin/bash

ENABLED=$(nmcli radio wifi | grep enabled)
DISABLED=$(nmcli radio wifi | grep disabled)

if [ $ENABLED ]
then
    nmcli radio all off
else [ $DISABLED ]
    nmcli radio wifi on
fi
