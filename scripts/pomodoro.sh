#! /bin/zsh
if [ -f ~/.pomodoro-timer ] 
then 
  TIMER_START=$(cat ~/.pomodoro-timer)
  EXPIRE=$(date -d $TIMER_START' 25 minutes' +'%s')
  NOW=$(date +'%s')
  if [ $EXPIRE -gt $NOW ]
  then 
    echo ' WIP'
  else
    echo ' Completed'
  fi
else
  echo ' '
fi

case $BLOCK_BUTTON in
	1) date > ~/.pomodoro-timer;;
	3) rm ~/.pomodoro-timer;;
esac
