#!/bin/bash

title="Becareful From Eye Strain"
message="Time for a break! Look away from your screen and focus on something 20 feet away."
# notify-send -t 20000 "Becareful From Eye Strain" "$message"
zenity --info --title "$title" --text "$message" --timeout=20
