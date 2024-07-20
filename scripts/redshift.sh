#!/bin/bash

#_ This part handles the configuration file for Redshift _#
# Specify the file name and content
file_name="$HOME/.config/redshift.conf"
file_content="
; Global settings for redshift
[redshift]
; Set the day and night screen temperatures
temp-day=5700
temp-night=3500

; Enable/Disable a smooth transition between day and night
; 0 will cause a direct change from day to night screen temperature.
; 1 will gradually increase or decrease the screen temperature.
transition=1

; Set the screen brightness. Default is 1.0.
;brightness=0.9
; It is also possible to use different settings for day and night
; since version 1.8.
;brightness-day=0.7
;brightness-night=0.4
; Set the screen gamma (for all colors, or each color channel
; individually)
gamma=0.8
;gamma=0.8:0.7:0.8
; This can also be set individually for day and night since
; version 1.10.
;gamma-day=0.8:0.7:0.8
;gamma-night=0.6

; Set the location-provider: 'geoclue', 'geoclue2', 'manual'
; type 'redshift -l list' to see possible values.
; The location provider settings are in a different section.
location-provider=manual

; Set the adjustment-method: 'randr', 'vidmode'
; type 'redshift -m list' to see all possible values.
; 'randr' is the preferred method, 'vidmode' is an older API.
; but works in some cases when 'randr' does not.
; The adjustment method settings are in a different section.
adjustment-method=randr

; Configuration of the location-provider:
; type 'redshift -l PROVIDER:help' to see the settings.
; ex: 'redshift -l manual:help'
; Keep in mind that longitudes west of Greenwich (e.g. the Americas)
; are negative numbers.
[manual]
lat=34.112080
lon=2.099080

; Configuration of the adjustment-method
; type 'redshift -m METHOD:help' to see the settings.
; ex: 'redshift -m randr:help'
; In this example, randr is configured to adjust screen 1.
; Note that the numbering starts from 0, so this is actually the
; second screen. If this option is not specified, Redshift will try
; to adjust _all_ screens.
[randr]
screen=0
"


#_ This part handles the startup of Redshift Service _#

# Use the echo command to write content to the file, overwriting it if it exists
echo "$file_content" > "$file_name"

# Optionally, you can display a message indicating that the file has been written
echo "File '$file_name' has 
been created or overwritten with the specified content."

mkdir -p ~/.config/autostart
script_name="Redshift.desktop"
echo -e "[Desktop Entry]\nType=Application\nExec=redshift &\nHidden=false\nNoDisplay=false\nX-GNOME-Autostart-enabled=true\nName=redshift &\nComment=Description of your script" > ~/.config/autostart/$script_name
echo "$script_name has been created"
chmod +x ~/.config/autostart/$script_name
