if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	if [ ! -e "~/.firstboot" ]; then
		touch ~/.firstboot
		echo "----------------------------------------------------------------------------------------"
		echo "if you need to change the usb configuration again run \`sudo python3 ~/configureusb.py\`"
		echo "if you want to skip the usb configuration press ctrl+c"
		sudo python3 ~/configureusb.py
		sudo reboot
	fi
    startx
fi