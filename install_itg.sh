#!/bin/sh
cd /temp
sudo apt-get install xorg xinit ssh links git vim alsa-utils -y
sudo systemctl enable ssh
sudo sed -i.bak 's/^%sudo.*/%sudo ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers
wget https://github.com/stepmania/stepmania/releases/download/v5.0.12/StepMania-5.0.12-Linux.tar.gz #known good version, this isn't super great but it ensures theme compatibility
tar xf Step*
mv Step*/stepmani*  /home/itg/stepmania
git clone --branch arcade https://github.com/paranoidnela/In-The-Groove2-SM5  /home/itg/stepmania/Themes/itg2-arcade
git clone --branch service https://github.com/paranoidnela/In-The-Groove2-SM5  /home/itg/stepmania/Themes/itg2-service
sudo lvcreate -l 100%FREE -n songs-lv itg-vg
sudo mkfs.ext4 /dev/itg-vg/songs-lv
sudo mkdir /mnt/Songs
sudo mount /dev/itg-vg/songs-lv /mnt/Songs/
sudo chown -R itg:itg /mnt/Songs/
mv  /home/itg/stepmania/Songs /mnt/Songs/Songs
mv  /home/itg/stepmania/BGAnimations /mnt/Songs/BGAnimations
sudo ln -s /mnt/Songs/Songs  /home/itg/stepmania/Songs
sudo ln -s /mnt/Songs/BGAnimations  /home/itg/stepmania/Songs
echo "/dev/itg-vg/songs-lv /mnt/Songs ext4 defaults 0 2" >> /etc/fstab
cp  /home/itg/ITG2-SM5_disk-image/system_files/home/itg/itg.sh /home/itg/itg.sh
cp  /home/itg/ITG2-SM5_disk-image/system_files/home/itg/video.sh /home/itg/video.sh
cp  /home/itg/ITG2-SM5_disk-image/system_files/home/itg/.xinitrc /home/itg/.xinitrc
cp  /home/itg/ITG2-SM5_disk-image/system_files/home/itg/.bash_profile /home/itg/.bash_profile
chmod +x  /home/itg/.bash_profile
chmod +x  /home/itg/*.sh
chmod +x ./.xinitrc
chmod +x  /home/itg/stepmania/stepmania
sudo apt-get install libmad0 libjpeg62-turbo libva2 libvorbisfile3 libatk1.0-0 libgdk-pixbuf-2.0-0 libcairo2 libpango1.0-0 libgtk2.0-0 libasound2 libjack0 libpulse0 libpcre3 -y
sudo ln -s /lib/x86_64-linux-gnu/libva.so.2.1700.0 /lib/x86_64-linux-gnu/libva.so.1 #TODO: this sucks and will break
sudo mkdir -p /etc/systemd/system/getty@.service.d/
sudo cp  /home/itg/ITG2-SM5_disk-image/system_files/etc/systemd/system/getty@.service.d/autologin.conf /etc/systemd/system/getty@.service.d/autologin.conf
sudo cp  /home/itg/ITG2-SM5_disk-image/system_files/etc/motd /etc/motd
sudo chown -R itg:itg  /home/itg/
#TODO: below kind of sucks as a solution
#echo "You may need to unmute and raise the volume in alsamixer if your stepmania has no sound, this is done by pressing Ctrl+Alt+F2 and running `alsamixer` (the m key will mute or unmute the selected channel, the up and down keys change the level of the selected channel and F6 selects between sound cards if there\'s a need ), then rebooting the system with a `sudo reboot` command"
#echo "You may need to unmute and raise the volume in alsamixer if your stepmania has no sound, this is done by pressing Ctrl+Alt+F2 and running `alsamixer` (the m key will mute or unmute the selected channel, the up and down keys change the level of the selected channel and F6 selects between sound cards if there\'s a need ), then rebooting the system with a `sudo reboot` command"
#echo "You may need to unmute and raise the volume in alsamixer if your stepmania has no sound, this is done by pressing Ctrl+Alt+F2 and running `alsamixer` (the m key will mute or unmute the selected channel, the up and down keys change the level of the selected channel and F6 selects between sound cards if there\'s a need ), then rebooting the system with a `sudo reboot` command"
#sleep 10
sudo reboot
