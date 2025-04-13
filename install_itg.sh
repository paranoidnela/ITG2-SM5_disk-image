#!/bin/sh
USER_HOME="/home/$SUDO_USER"

cd /tmp
sudo apt-get install xorg xinit ssh links git vim alsa-utils psmisc thunar python3-watchdog arandr -y
sudo systemctl enable ssh
sudo sed -i.bak 's/^%sudo.*/%sudo ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
wget https://github.com/stepmania/stepmania/releases/download/v5.0.12/StepMania-5.0.12-Linux.tar.gz #known good version, this isn't super great but it ensures theme compatibility
tar xf Step*
mv Step*/stepmani* $USER_HOME/stepmania
git clone --branch arcade https://github.com/paranoidnela/In-The-Groove2-SM5 $USER_HOME/stepmania/Themes/itg2-arcade
git clone --branch service https://github.com/paranoidnela/In-The-Groove2-SM5 $USER_HOME/stepmania/Themes/itg2-service
cp $USER_HOME/ITG2-SM5_disk-image/system_files/home/itg/itg.sh $USER_HOME/itg.sh
cp $USER_HOME/ITG2-SM5_disk-image/system_files/home/itg/audio.sh $USER_HOME/audio.sh
cp $USER_HOME/ITG2-SM5_disk-image/system_files/home/itg/video.sh $USER_HOME/video.sh
cp $USER_HOME/ITG2-SM5_disk-image/system_files/home/itg/filemanager.sh $USER_HOME/filemanager.sh
cp $USER_HOME/ITG2-SM5_disk-image/system_files/home/itg/videosetup.sh $USER_HOME/videosetup.sh
cp $USER_HOME/ITG2-SM5_disk-image/system_files/home/itg/configureusb.py $USER_HOME/configureusb.py
cp -r $USER_HOME/ITG2-SM5_disk-image/system_files/home/itg/.stepmania-5.0/ $USER_HOME/.stepmania-5.0/
cp $USER_HOME/ITG2-SM5_disk-image/system_files/home/itg/.xinitrc $USER_HOME/.xinitrc
cp $USER_HOME/ITG2-SM5_disk-image/system_files/home/itg/.xinitrc_filemanager $USER_HOME/.xinitrc_filemanager
cp $USER_HOME/ITG2-SM5_disk-image/system_files/home/itg/.xinitrc_video $USER_HOME/.xinitrc_video
cp $USER_HOME/ITG2-SM5_disk-image/system_files/home/itg/.bash_profile $USER_HOME/.bash_profile
chmod +x $USER_HOME/.bash_profile
chmod +x $USER_HOME/*.sh
chmod +x $USER_HOME/configureusb.py
chmod +x $USER_HOME/.xinitrc*
chmod +x $USER_HOME/stepmania/stepmania
sudo apt-get install libmad0 libjpeg62-turbo libva2 libvorbisfile3 libatk1.0-0 libgdk-pixbuf-2.0-0 libcairo2 libpango1.0-0 libgtk2.0-0 libasound2 libjack0 libpulse0 libpcre3 -y
sudo ln -s /lib/x86_64-linux-gnu/libva.so.2.1700.0 /lib/x86_64-linux-gnu/libva.so.1 #TODO: this sucks and will break
sudo mkdir -p /etc/systemd/system/getty@.service.d/
sudo cp $USER_HOME/ITG2-SM5_disk-image/system_files/etc/systemd/system/getty@.service.d/autologin.conf /etc/systemd/system/getty@.service.d/autologin.conf
sudo cp $USER_HOME/ITG2-SM5_disk-image/system_files/etc/motd /etc/motd
sudo cp $USER_HOME/ITG2-SM5_disk-image/system_files/etc/udev/rules.d/99-usb-autmount.rules /etc/udev/rules.d/99-usb-autmount.rules
sudo cp $USER_HOME/ITG2-SM5_disk-image/system_files/usb-mount.sh /usb-mount.sh
sudo cp $USER_HOME/ITG2-SM5_disk-image/system_files/usb-unmount.sh /usb-unmount.sh
sudo chmod +x /usb-mount.sh
sudo chmod +x /usb-unmount.sh
sudo mkdir /mnt/usb
sudo mkdir /mnt/p1
sudo mkdir /mnt/p2
sudo chown -R itg:itg /mnt/usb
sudo chown -R itg:itg /mnt/p1
sudo chown -R itg:itg /mnt/p2
sudo chown -R itg:itg $USER_HOME
sudo reboot
