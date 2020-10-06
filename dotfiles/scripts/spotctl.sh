#!/bin/bash

if ! pidof spotify > /dev/null
then
	echo 'Spotify is not running'
	polybar-msg hook playpause 1 1> /dev/null
	exit 1
fi

metadata=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata')

song_name=$(echo "$metadata" | grep -i -A 1 "title" | grep "variant" | cut -d'\n' -f 2- | rev | cut -c 2- | rev)
artist_name=$(echo "$metadata" | grep -i -A 2 ":artist" | tail -n+3 | cut -d'"' -f 2)
podcast_name=$(echo "$metadata" | grep -i -A 2 ":album" | grep "variant" | head -1 | cut -d'"' -f 2)
playerstatus=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus' | tail -n+2 | cut -d'"' -f 2)

if [[ $1 == "next" ]]
then
	dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
elif [[ $1 == "prev" ]]
then
	dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
elif [[ $1 == "pause" ]] || [[ $1 == "play" ]] || [[ $1 == "playpause" ]]
then
	dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
elif [[ $1 == "status" ]]
then
	echo "$playerstatus"
	if [[ $playerstatus == 'Playing' ]]
	then
		polybar-msg hook playpause 2 1> /dev/null
	else
		polybar-msg hook playpause 3 1> /dev/null
	fi
elif [[ $1 == "info" ]] && [[ "$(echo "$metadata" | grep "episode" | wc -l)" == "0" ]]
then
	echo "$artist_name": "$song_name"
else
    	echo "$podcast_name": "$song_name"
fi

