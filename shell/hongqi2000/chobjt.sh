#/bin/bash

#cd /opt/tsos/build/buildscript/obj.t/other 

#将tsoslogin加入到obj.t里去
#sudo tar xvf target.tar.bz2 
#sudo rm usr/share/tsos/tsoslogin/tsoslogin
#cp /home/jeff/temp/tsoslogin/tsoslogin usr/share/tsos/tsoslogin/
#sudo rm target.tar.bz2
#tar cvjf target.tar.bz2 usr etc bin 
#rm usr etc bin -rf 

#制作squa.target
cd /opt/tsos/build/buildscript
sudo cp obj.t/*  /opt/tsos/build/buildscript/workshop  -av

cd /opt/tsos/build/buildscript/workshop
#rm chroot/* -rf 
#tar xvf data/base.tar.bz2 -C chroot 

#bash install.sh
  
#bash rmact.sh

bash addtar.sh

#sudo bash addtar.sh
rm filesystem.squashfs
sudo bash mksquashfs.sh
sudo cp filesystem.squashfs /opt/tsos/build/buildscript/squa.target

#制作改变objt后的target.iso
cd /opt/tsos/build/buildscript
sudo cp obj.l/*  /opt/tsos/build/buildscript/workshop  -av
#sudo rm -rf iso
sudo bash mktargetiso.sh squa.livecd squa.target target.iso 

