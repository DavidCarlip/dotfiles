#!/bin/bash

setxkbmap -print | grep 'dvorak'&> /dev/null

if [ $? == 0 ]
then
  setxkbmap us
  setxkbmap -option caps:swapescape
else
  setxkbmap dvorak
  setxkbmap -option caps:swapescape
fi
