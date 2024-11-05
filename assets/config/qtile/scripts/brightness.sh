#!/bin/bash
display_name=$(xrandr --query | grep " connected" | cut -d ' ' -f1)
current_brightness=$(xrandr --verbose | grep -m 1 -i brightness | awk '{print $2}')
step=0.1

case $1 in
    up )
        new_brightness=$(echo "$current_brightness + $step" | bc)
        if (( $(echo "$new_brightness > 2" | bc -l) )); then
                    new_brightness=2
            fi
        xrandr --output $display_name --brightness $new_brightness
        ;;
    down )
        new_brightness=$(echo "$current_brightness - $step" | bc)
                if (( $(echo "$new_brightness < 0.1" | bc -l) )); then
            new_brightness=0.1
        fi
        xrandr --output $display_name --brightness $new_brightness
        ;;
esac

echo $current_brightness
