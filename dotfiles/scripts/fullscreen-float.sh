if ! pidof polybar > /dev/null
then
    polybar bar &
else
    pkill polybar && bspc config top_padding 0
fi
