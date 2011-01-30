##	Do this on the Ubuntu system
sudo uck-remaster-clean
sudo uck-remaster-unpack-iso ubuntu-mini-remix-10.10-i386.iso
sudo uck-remaster-unpack-rootfs
sudo uck-remaster-chroot-rootfs

## Now we are in the iso
## We need to uncoment the universe sources
nano /etc/apt/sources.list

## Install Dependencies
apt-get update
apt-get install git
apt-get install xorg
apt-get install sdlmame
apt-get install joystick
apt-get install sdlmame-tools
apt-get install python-chardet
apt-get install python-pygame
apt-get install ffmpeg
apt-get install gstreamer0.10-ffmpeg

## Install WahCade
cd /tmp
wget http://www.anti-particle.com/projects/wahcade/wahcade_0.99pre8_all.deb
dpkg -i wahcade_0.99pre8_all.deb
apt-get -f install
dpkg -i wahcade_0.99pre8_all.deb

mkdir /usr/local/share/emulators;
mkdir /usr/local/share/emulators/mame;
mkdir /usr/local/share/emulators/mame/roms;
mkdir /usr/local/share/emulators/mame/cpanel;
mkdir /usr/local/share/emulators/mame/flyers;
mkdir /usr/local/share/emulators/mame/marquees;
mkdir /usr/local/share/emulators/mame/snap;
mkdir /usr/local/share/emulators/mame/cfg;
mkdir /usr/local/share/emulators/mame/nvram;
mkdir /usr/local/share/emulators/mame/memcard;
mkdir /usr/local/share/emulators/mame/inp;
mkdir /usr/local/share/emulators/mame/sta;
mkdir /usr/local/share/emulators/mame/diff;
mkdir /usr/local/share/emulators/mame/comments;
mkdir /etc/sdlmame
mkdir /usr/share/xsessions

## Setup WahCade
git clone git://github.com/karpinsn/Zencade.git Zencade
mv Zencade/mameFiles/Catver.ini /usr/local/share/emulators/mame/Catver.ini
mv Zencade/mameFiles/controls.ini /usr/local/share/emulators/mame/controls.ini
mv Zencade/mameFiles/history.dat /usr/local/share/emulators/mame/history.dat
mv Zencade/mameFiles/mame.ini /etc/sdlmame/mame.ini
mv Zencade/mameFiles/arcade.desktop /usr/share/xsessions/arcade.desktop


wget http://www.alphaboxmedia.net/packages/wahcade.zip -O /home/mame/wahcade.zip;
unzip /home/mame/wahcade.zip -d /home/mame/;

## Clean up leftovers
apt-get autoclean
rm /var/cache/apt/archives/*.deb
rm /tmp/*

## Exit the iso
exit

## Repack the iso
sudo uck-remaster-pack-rootfs
sudo uck-remaster-pack-iso Zencade.iso