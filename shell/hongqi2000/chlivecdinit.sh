#/bin/bash 
cd /opt/tsos/build/kernel/build_boot/

sudo make 

cd /opt/tsos/build/buildscript/obj.l/data

sudo tar xvf boot.tar.bz2 

cd iso/casper 

sudo rm bzImage

sudo cp /opt/tsos/build/kernel/build_livecd/arch/x86/boot/bzImage .

#sudo mv bzImage tboot 

cd /opt/tsos/build/buildscript/obj.l/data 

sudo rm boot.tar.bz2 

sudo tar cvjf boot.tar.bz2 iso 

cd /opt/tsos/build/buildscript

sudo cp obj.l/* workshop  -av 

cd /opt/tsos/build/buildscript

#sudo rm iso/ -rf

sudo bash mktargetiso.sh  squa.livecd  squa.target target.iso

#./scp.sh





