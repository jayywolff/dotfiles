#!/bin/bash
batinf='acpi -b'
perc=$(acpi -b | awk '{print $4;}' | sed 's/%//g' | sed 's/,//g' | head -n1)
charging=$(acpi -b | head -n1 | grep -c Discharging)
if [ ! $charging -eq 1 ]
then echo " $perc%"
elif [ $perc -gt 75 ]
then echo "  $perc%"
elif [ $perc -gt 50 ]
then echo "  $perc%"
elif [ $perc -gt 25 ]
then echo "  $perc%"
elif  [ $perc -gt 10 ]
then echo "  $perc%"
else
echo "  $perc%"
fi
