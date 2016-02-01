#!/bin/bash
WeatherString=$(curl -s http://www.accuweather.com/en/at/innsbruck/31197/weather-forecast/31197 | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $14 " " $10 }' | head -1)
state=$(echo $WeatherString | awk '{print $1;}')
temp=$(echo $WeatherString | awk '{print $2;}')


if [[ $state == *"Sunny"*  ]]
then
	echo "  $temp°"
elif [[ $state == *"Cloud"* ]]
then
	echo "  $temp°"
elif [[ $state == *"Clear"* ]]
then
	echo " $temp°"
elif [[ $state == *"Rainy"* ]]
then
	echo " $temp°"
elif [[ $state == *"Thunder"* ]]
then
	echo " $temp°"
else
	echo " $ftemp°"
fi

