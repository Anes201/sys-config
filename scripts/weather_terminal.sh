#!/bin/bash

# Your OpenWeatherMap API key
API_KEY="8c3b64cf7c6egrdnotapidefe184385e"

# Your city and country code (e.g., "City,US")
LOCATION="City,US"

# Get weather data for today
today_weather=$(curl -s "https://api.openweathermap.org/data/2.5/weather?q=$LOCATION&appid=$API_KEY")

# Extract relevant information from the JSON response (you'll need to adjust this based on the API you use)
avg_temp_today=$(echo "$today_weather" | jq '.main.temp' | awk '{printf "%.1f", $1 - 273.15}')
rain_today=$(echo "$today_weather" | jq '.weather[0].description')
wind_speed_today=$(echo "$today_weather" | jq '.wind.speed')


# Display the weather information
echo "------------------------"
echo "Today's Weather:"
echo "Average Temperature: $avg_temp_today°C"
echo "Possibility of Rain: $rain_today"
echo "Average Wind Speed: $wind_speed_today m/s"
