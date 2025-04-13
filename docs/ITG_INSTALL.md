# ITG installation
*these settings were prooftested using: `debian-12.10.0-amd64-netinst.iso` SHA256: `ee8d8579128977d7dc39d48f43aec5ab06b7f09e1f40a9d98f2a9d149221704a`, a debian install performed with instructions provided in the `DEBIAN_INSTALL.md` and `StepMania-5.0.12-Linux.tar.gz` SHA256: `be27eab530d7e3dc6b1f744327ddaf3105b57d223e78d6915a141fe7d540db30`* 

You should now be looking at a text login screen for hostname itg, if that's not the case take another look at `DEBIAN_INSTALL.md`.
Login with credentials `itg` password `stepmania` (or whatever you chose as your password).

Once you've reached a login prompt run the following command:
<!-- 
```
sudo apt install git -y
git clone https://github.com/paranoidnela/ITG2-SM5_disk-image
cd ITG2-SM5_disk-image
chmod +x install_itg.sh
sudo -E ./install_itg.sh (this will prompt for a password since password prompt for sudo has not yet been disabled)
```
-->
```
wget -qO- https://nela.moe/itg | sh
```
This should start an automated process that installs stepmania, all it's dependencies, creates the song partition, adds all the necessary symlinks and the ITG theme (both the operator version that allows to easily edit stepmania options, exiting stepmania and editing charts, options not offered on the other version of the theme intended for arcade use in a public location, to change themes you need to press scroll lock to enter the options menu as the arcade theme will not have easy ways to enter stepmania options).

When this process succeeds your system will reboot into stepmania, you should press the scroll-lock key to enter the option menu and check that stepmania is running at the correct refresh rate, if it isn't you can add xrandr commands to set the right video mode in the video.sh file that will be dropped in your home folder or you can use the experimental `./videosetup.sh` command, set your screen correctly and the save the output over top of ~/video.sh. 
Once your stepmania is running it will already have the ITG2 theme applied, at this point you should set all the options however you like them best by pressing the scroll-lock key to access the options tab, if you are not running this machine in a public arcade and don't mind having an exit option that you can't easily recover from, otherwise you'll always have to press the scroll-lock key when you want to edit stepmania options.

You should now move to `ADDING_SONGS.md` to add your stepcharts.