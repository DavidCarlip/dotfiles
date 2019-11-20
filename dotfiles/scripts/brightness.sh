#!/bin/bash
current_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
if [[ $1 == +* ]]
then
	addition=${1:1}
	echo $((current_brightness + addition)) | sudo tee /sys/class/backlight/intel_backlight/brightness
elif [[ $1 == -* ]]
then	
	subtraction=${1:1}
	echo $((current_brightness - subtraction)) | sudo tee /sys/class/backlight/intel_backlight/brightness
elif [[ $1 == *% ]]
then
	percentage=${1::-1}
	echo $((percentage * max_brightness / 100 )) | sudo tee /sys/class/backlight/intel_backlight/brightness
else
	echo $1 | sudo tee /sys/class/backlight/intel_backlight/brightness
fi
