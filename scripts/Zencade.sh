#!/bin/sh

while :
do
 clear
 echo "---------- Zencade Creation Script ----------"
 echo "               Ubuntu 10.10                  "
 echo " "
 echo " 1. Download Ubuntu Mini Remix"
 echo " 2. Mount image file system"
 echo " 22. Reenter the iso without cleaning"
 echo " 3. Create Roms & Snaps Directory"
 echo " 4. Copy Roms & Snaps"
 echo " 5. Clean unmount and repack image" 
 echo " 9. Exit"
 echo " "
 echo " Please enter option [1 - 4 or 9]"
 read opt
 case $opt in

 1) clear;
    echo "Downloading Ubuntu mini remix 10.10";
    wget -c http://www.ubuntu-mini-remix.org/download/10.10/ubuntu-mini-remix-10.10-i386.iso -O base.iso; 
    echo "Complete, Press [enter] to continue";
    read enterKey;;

 2) clear;
    echo "Installing Ubuntu Customization Kit";
    sudo apt-get install uck;

    echo "Mounting the image file system";
    ##	Do this on the Ubuntu system
    sudo uck-remaster-clean;
    sudo uck-remaster-unpack-iso base.iso;
    sudo uck-remaster-unpack-rootfs;
    sudo cp InnerScript.sh /tmp/InnerScript.sh;
    sudo chmod go+rx /tmp/InnerScript.sh;
    sudo uck-remaster-chroot-rootfs ~/tmp /tmp/InnerScript.sh;
    ## Now we are in the iso
    echo "Complete, Press [enter] to continue";
    read enterKey;;

 22) clear;
    echo "Reentering the iso without cleaning"    
    sudo cp InnerScript.sh /tmp/InnerScript.sh;
    sudo chmod go+rx /tmp/InnerScript.sh;
    sudo uck-remaster-chroot-rootfs ~/tmp /tmp/InnerScript.sh;
    ## Now we are in the iso
    echo "Complete, Press [enter] to continue";
    read enterKey;;

 3) clear;
    echo "Creating Roms & Snaps directory"

    mkdir Roms;
    mkdir Snaps;

    echo "Exit the script and place the roms in the Roms directory"
    echo "and the snaps in the Snaps directory"

    echo "Complete, Press [enter] to continue";
    read enterKey;;

 4) clear;
    echo "Copying Roms & Snaps to image";
    sudo cp -r ./Roms/* ~/tmp/remaster-root/home/mame/emulators/mame/roms/
    sudo cp -r ./Snaps/* ~/tmp/remaster-root/home/mame/emulators/mame/snap/

    echo "Complete, Press [enter] to continue";
    read enterKey;;

 5) clear;
    echo "Repack the iso";
    sudo uck-remaster-pack-rootfs;
    sudo uck-remaster-pack-iso Zencade.iso;
    echo "Complete, Press [enter] to continue";
    read enterKey;;

 9) clear;
    echo "Bye $USER";
    exit 1;;

 *) clear;
    echo "Invalid option: $opt. Please select a valid option";
    echo "Press [enter] key to continue";
    read enterKey;;

esac
done
