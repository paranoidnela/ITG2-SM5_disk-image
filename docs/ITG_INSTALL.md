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

When this process succeeds your system will reboot into stepmania, you should check that stepmania is running at the correct refresh rate, if it isn't you can add xrandr commands to set the right video mode in the video.sh file that will be dropped in your home folder. 
Once your stepmania is running it will look like default stepmania, at this point you should set all the options however you like them best, minding to change the theme last to the arcade version (unless you are fine with having the option to exit the game which in an arcade setting isn't super easy to recover from.) If you want to change theme options you will need to hit scroll-lock after the theme has been changed and use the theme options tab at the bottom of the menu which would otherwise be unaccessible in the arcade version of the theme.

You should now move to `ADDING_SONGS.md` to add your stepcharts.