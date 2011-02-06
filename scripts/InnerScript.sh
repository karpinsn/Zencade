#!/bin/sh

while :
do
 clear
 echo "---------- Zencade Inner Script ----------"
 echo "               Ubuntu 10.10                  "
 echo " "
 echo " 1. Install dependencies"
 echo " 2. Setup Mame"
 echo " 3. Cleanup leftovers"
 echo " 9. Exit"
 echo " "
 echo "Please enter option [1 - 2 or 9]"
 read opt
 case $opt in

 1) clear;
    echo "Installing dependencies";

    echo "Adding Universe repositories";
    echo deb http://archive.ubuntu.com/ubuntu maverick universe >> /etc/apt/sources.list;
    echo deb-src http://archive.ubuntu.com/ubuntu maverick universe >> /etc/apt/sources.list;    

    echo "Installing Dependencies";
    apt-get update;
    apt-get -y install git;
    apt-get -y install unzip;
    apt-get -y install xorg;
    apt-get -y install sdlmame;
    apt-get -y install joystick;
    apt-get -y install sdlmame-tools;
    apt-get -y install python-chardet;
    apt-get -y install python-pygame;
    apt-get -y install ffmpeg;
    apt-get -y install gstreamer0.10-ffmpeg;

    echo "Installing WahCade"
    cd /tmp;
    wget http://www.anti-particle.com/projects/wahcade/wahcade_0.99pre8_all.deb;
    dpkg -i wahcade_0.99pre8_all.deb;
    apt-get -f -y install;
    dpkg -i wahcade_0.99pre8_all.deb;

    echo "Setting up X";
    mkdir /home/ubuntu;
    touch /home/ubuntu/.profile;
    echo "if [ -z \"\$DISPLAY\" ] && [ \$(tty) == /dev/tty1 ]; then startx fi" >> /home/ubuntu/.profile;

    echo "Complete, Press [enter] to continue";
    read enterKey;;

 2) clear;
    echo "Setting up mame"

    mkdir /home/mame; 
    mkdir /home/mame/emulators;
    mkdir /home/mame/emulators/mame;
    mkdir /home/mame/emulators/mame/roms;
    mkdir /home/mame/emulators/mame/cpanel;
    mkdir /home/mame/emulators/mame/flyers;
    mkdir /home/mame/emulators/mame/marquees;
    mkdir /home/mame/emulators/mame/snap;
    mkdir /home/mame/emulators/mame/cfg;
    mkdir /home/mame/emulators/mame/nvram;
    mkdir /home/mame/emulators/mame/memcard;
    mkdir /home/mame/emulators/mame/inp;    
    mkdir /home/mame/emulators/mame/sta;
    mkdir /home/mame/emulators/mame/diff;
    mkdir /home/mame/emulators/mame/comments;
    mkdir /etc/sdlmame;
    mkdir /usr/share/xsessions;
   
    echo "Setting up WahCade";   
    cd /tmp;
    git clone git://github.com/karpinsn/Zencade.git Zencade;
    mv Zencade/mameFiles/Catver.ini /home/mame/emulators/mame/Catver.ini;
    mv Zencade/mameFiles/controls.ini /home/mame/emulators/mame/controls.ini;
    mv Zencade/mameFiles/history.dat /home/mame/emulators/mame/history.dat;
    mv Zencade/mameFiles/mame.ini /etc/sdlmame/mame.ini;
    mv Zencade/mameFiles/arcade.desktop /usr/share/xsessions/arcade.desktop;
    
    wget http://www.alphaboxmedia.net/packages/wahcade.zip -O /home/mame/wahcade.zip;
    unzip /home/mame/wahcade.zip -d /home/mame/;
    rm /home/mame/wahcade.zip;
  
    echo "Setting permissions";
    chown root:root /etc/sdlmame/mame.ini;
    chmod 644 /etc/sdlmame/mame.ini;

    chown root:root /usr/share/xsessions/arcade.desktop;
    chmod 644 /usr/share/xsessions/arcade.desktop;

    chmod 744 -R /home/mame/.wahcade;
    chown root:root -R /home/mame/.wahcade;

    echo "Complete, Press [enter] to continue";
    read enterKey;;

 3) clear;
    echo "Unmounting iso and repacking filesystem";

    echo "Cleaning up leftovers";
    apt-get autoclean;
    rm /var/cache/apt/archives/*.deb;
    rm /tmp/*;

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
