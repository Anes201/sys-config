#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root (sudo)." >&2
    exit 1
fi

# List of programs to install (add or remove programs here)
programs=(
# Add more programs as needed
curl
htop
git
python3-pip
psensor
lm-sensors
jq
acpi
python-is-python3
geany
)

# Construct the install command
install_command="apt install ${programs[*]}"

# Execute the install command
echo "Installing programs: ${programs[*]}"
eval "$install_command"

