#!/bin/bash

t=`cat /proc/uptime`

IFS='.' read -r -a array <<< "$t"

current="${array[0]}"

remaning=$((28800 - current))

if [[ remaning < 3600 ]]; then # jeśli mniej niż godzina
	hours=0
	min=$((remaning / 60 + 1))
else # jeśli więcej jak godzine
	hours=$((remaning / 3600))
	hoursInSec=$((hours * 3600))
	min=$(((remaning - hoursInSec) / 60 + 1 ))
fi

notify-send -i face-wink "Zostało $hours godzin i $min minut"