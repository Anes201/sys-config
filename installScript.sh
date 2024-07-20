sudo apt update

sudo apt install curl redshift htop lm-sensors fish git python-is-python3 acpi rofi tree tmux neofetch psensor   

sudo add-apt-repository ppa:slgobinath/safeeyes
sudo apt install safeeyes
# move the configs
mkdir -p ~/.config/tmux && cp ./dotconfig/tmux.conf ~/.config/tmux/tmux.conf
mkdir -p ~/.config/htop && cp ./dotconfig/htoprc ~/.config/htop/htoprc
mkdir -p ~/.config/geany && cp -r ./dotconfig/geany ~/.config
