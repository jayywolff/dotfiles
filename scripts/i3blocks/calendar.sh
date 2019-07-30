#!/bin/bash
echo $(date '+%D')

case $BLOCK_BUTTON in
	1) termite -e 'cal -3; sleep 5';;
esac
