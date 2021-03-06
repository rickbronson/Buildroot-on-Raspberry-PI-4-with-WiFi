  Buildroot-on-Raspberry-PI-4-with-WiFi
==========================================

This is everything you need to build the Buildroot-on-Raspberry-PI-4-with-WiFi under Linux.  Buildroot is a super lightweight embedded distribution of Linux that cuts out all the fluff.  The cool thing about Buildroot on Raspberry Pi 4 is that it boots in about 10 seconds into Linux.  It consists of Makefile that get's and un-archive's Buildroot, then fixes up the .config file, and finally copies over some needed WiFi files to the target dir.

Debian Buster was used to build.

  Instructions

1. Make sure you have all the necessary packages to build.

```
sudo apt-get install autoconf automake autotools-dev build-essential
```

2. Un-archive and build everything:

```
mkdir ~/boards/rpi4; cd ~/boards/rpi4 # for example
git clone https://github.com/rickbronson/Buildroot-on-Raspberry-PI-4-with-WiFi.git
make prepare
make buildroot
make postbuild
make flash # first set the "/dev/sdX" in the Makefile

```

Insert SD Card in Raspberry PI 4 and power up while watching the serial port via:
```
minicom USB0 -w -C ~/minicom.USB0-rpi4.cap
```

When it prompts you for login type "root" and do the following to setup your WiFi:

```
# wpa_cli
scan
scan_results
remove_network 0
add_network
set_network 0 ssid "YourRouterSSID"
set_network 0 psk "YourPasscode"
enable_network 0
save_config
status
quit
reboot
```

When it reboots it should connect to your router.

3. Hookup USB-Serial
--------------

Simplified hookup of the Raspberry PI 4 with serial USB
![USB Serial hookup](https://github.com/rickbronson/Buildroot-on-Raspberry-PI-4-with-WiFi/blob/master/schematic1.png "USB Serial hookup")

4. Comments/suggestions

  Please contact me at rick AT efn DOT org
