# 
# Copyright (C) 2020 Rick Bronson (rick AT efn.org)
# Licensed under the GPL
#
# Makefile for building buildroot on Raspberry PI 4

# Get Buildroot and copy over new .config file
prepare:
	wget https://buildroot.org/downloads/buildroot-2020.08-rc1.tar.bz2
	tar jxf buildroot-2020.08-rc1.tar.bz2
	cp -f config buildroot-2020.08-rc1/.config

# build it up
buildroot:
	cd buildroot-2020.08-rc1; make

# Add in WiFi files, only need to do this the first time you run "make buildroot"
postbuild:
	cp cypress/firmware/*blob  cypress/firmware/*.txt buildroot-2020.08-rc1/output/target/lib/firmware/brcm
	cp -a etc buildroot-2020.08-rc1/output/target
	cd buildroot-2020.08-rc1; make

flash:
	sudo dd if=buildroot-2020.08-rc1/output/images/sdcard.img of=/dev/sdX bs=1M
	sync
