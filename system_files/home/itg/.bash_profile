if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	if [ ! -e "$HOME/.firstboot" ]; then
		touch ~/.firstboot
		USER_HOME=$HOME
		echo "----------------------------------------------------------------------------------------"
		echo "Creating the Songs partition and adding an automount entry"
		sudo lvcreate -l 100%FREE -n songs-lv --wipesignatures y --yes --zero y itg-vg
		sudo mkfs.ext4 /dev/itg-vg/songs-lv
		sudo mkdir /mnt/Songs
		sudo mount /dev/itg-vg/songs-lv /mnt/Songs/
		sudo chown -R itg:itg /mnt/Songs/
		mv $USER_HOME/stepmania/Songs /mnt/Songs/Songs
		mv $USER_HOME/stepmania/BGAnimations /mnt/Songs/BGAnimations
		sudo ln -s /mnt/Songs/Songs $USER_HOME/stepmania/Songs
		sudo ln -s /mnt/Songs/BGAnimations $USER_HOME/stepmania/Songs
		sudo bash -c 'echo "/dev/itg-vg/songs-lv /mnt/Songs ext4 defaults 0 2" >> /etc/fstab'
		echo "----------------------------------------------------------------------------------------"
		echo "Assigning USB ports"
		echo "if you need to change the usb configuration again run \`sudo python3 ~/configureusb.py\`"
		printf "Do you want to assign USB ports for player profiles now?"
		while true; do
			read -p "$* [y/n]: " yn
			case $yn in
				[Yy]*) sudo python3 ~/configureusb.py && sudo reboot ;;  
				[Nn]*) sudo reboot ;;
			esac
		done
		sudo reboot
	fi
    startx
fi