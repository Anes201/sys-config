#!/bin/bash

# Function to display key-value pairs
show_info() {
    echo -e "  --> $1: $2"
}

sensor_output=$(sensors)

# Get uptime
uptime=$(uptime -p)

# Get battery status (requires acpi package)
battery=$(acpi | awk '{print $3 $4}')

# Get CPU temperature (requires lm-sensors package)
cpu_temp=$(echo "$sensor_output" | grep 'Core 0' | awk '{print $3}')

# Get HDD temperature (requires smartmontools package)
#hdd_temp=$(smartctl -a /dev/sda | grep 'Temperature_Celsius' | awk '{printf "%s C°", $10}')

# Display system information
echo '|-------------------------------------------|'
echo '#---------------PC MONITORING---------------#'
echo -e '|-------------------------------------------| \n'
show_info "Uptime" "$uptime"
show_info "Battery" "$battery"
show_info "CPU Temp" "$cpu_temp"
#show_info "HDD Temp" "$hdd_temp"
echo -e '\n|-------------------------------------------|'

# Add more key-value pairs as needed
# show_info "Key" "Value"

# You can add more information by following the show_info format

exit
# weather_terminal.sh


# Your OpenWeatherMap API key
API_KEY="8c3b64cf7cdefnotAPI650e184385e"

# Your city and country code (e.g., "City,US")
LOCATION="City,US"

# Get weather data for today
today_weather=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$LOCATION&appid=$API_KEY")

# Extract relevant information from the JSON response (you'll need to adjust this based on the API you use)
avg_temp_today=$(echo "$today_weather" | jq '.main.temp' | awk '{printf "%.1f", $1 - 273.15}')
rain_today=$(echo "$today_weather" | jq '.weather[0].description')
wind_speed_today=$(echo "$today_weather" | jq '.wind.speed')


# Display the weather information
#echo '#------------------WEATHER------------------#'
#echo -e '|-------------------------------------------| \n'
#echo -e "  --> Today's Weather:"
#echo -e "  --> Average Temperature: $avg_temp_today°C"
#echo -e "  --> Possibility of Rain: $rain_today"
#echo -e "  --> Average Wind Speed: $wind_speed_today m/s"
#echo -e '\n|-------------------------------------------|'
