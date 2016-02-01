#!/bin/bash

State=$(pgrep openvpn)

if [ -z "$State" ]; then
	echo ""
else
	echo ""
fi

case $BLOCK_BUTTON in
	1) ( sh /home/effi/dotfiles/scripts/openvpn.sh & ) && disown;;
	
esac

