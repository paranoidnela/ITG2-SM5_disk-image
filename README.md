# ITG2-SM5_disk-image
*note: before running any of the scripts or installation helpers in this repository you are expected to start off with a blank debian install with ONLY the following components: `SSH server, standard system utilities`, THIS MEANS NO `Debian desktop enviroment or GNOME`.*

This repository contains tools and utilities I developed or found to create a modern SM5 image that simulates the experience of a hacked ITG2 cab on the modern Stepmania 5 engine.

Installation instructions start at `docs/DEBIAN_INSTALL.md` so give that file (and this file) a good read before opening any issues.

# Development motivation
I tried out `TJ's ITG System Image` and while being perfectly workable to me it looks and feels quite janky, both on a system level and on a theme level, installing `In-The-Groove2-SM5` on it wouldn't have worked anyway because ITGmania does not support the theme in the first place.

# Goals:
- Maintain a (mostly) arcade accurate UI and UX, QoL improvements are allowed as long as they aren't janky or hacky
- Run modern stepmania
- Run modern linux
- Create a maintainable, well documented and clean implementation
- Resiliency to hard power downs
- Usability in a public arcade location

# External components:
*which are not to be considered under the same license as this repository or any of my work for this project*
- Debian GNU/Linux
- All the software packages installed on top of debian both by it's own installer and tools found in this directory
- Stepmania
- In-The-Groove2-SM5 (I will use modified version of my personal fork, all credits to Jose Varela for creating the theme)
- Any kernel and userspace modules to enable light and input support with your specific setup (you are expected to install and maintain these yourself, if these break or cause your image to break I will not be able to help you)
- Any stepcharts, noteskins, bganimations or other user provieded content to make the system image useful

# Theory of operations:
*note: this may change over time when better and less lazy solutions are found to various challanges encountered along the way*

`/` is always mounted as RW, this is not great for data corruption reasons but I want to keep track of stats and I am too lazy to implement it in a better way for now. 
The songs partition is also mounted as RW during boot but when the system has booted getty will autologin into user `itg` which has a script in `.bash_profile` that detects if bash was started on the tty and when it is it will run startx, startx will run the itg.sh script that will disable display power management, blanking and other stuff (this is done because in testing I figured out that even runing Xorg WMless the display will still try to go in some kind of power saving mode after an inactivity timeout has been reached), and finally remount the songs partition in RO to then start stepmania. 
