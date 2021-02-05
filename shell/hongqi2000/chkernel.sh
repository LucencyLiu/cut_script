#!/bin/bash

#进入obj.l
cd /opt/tsos/build/buildscript/obj.l/data
sudo tar xvf boot.tar.bz2

#copy boot的内核
cd iso/boot/casper
sudo cp /opt/tsos/build/kernel/build_boot/arch/x86/boot/bzImage .
sudo rm tboot
sudo mv bzImage tboot

#copy livecd的内核
cd /opt/tsos/build/buildscript/obj.l/data/iso/casper
sudo rm bzImage 
sudo cp /opt/tsos/build/kernel/build_livecd/arch/x86/boot/bzImage .


#给boot打包
cd /opt/tsos/build/buildscript/obj.l/data
sudo rm boot.tar.bz2
sudo tar cvjf boot.tar.bz2 iso

#更换modules模块
cd /opt/tsos/build/buildscript/obj.l/data
sudo rm modules.tar.bz2
sudo cp /opt/tsos/build/kernel/lib_livecd/modules.tar.bz2 .

cd /opt/tsos/build/buildscript/obj.t/data
sudo rm modules.tar.bz2
sudo cp /opt/tsos/build/kernel/lib_boot/modules.tar.bz2 .

#制作iso
cd /opt/tsos/build/buildscript
sudo cp obj.l/* workshop  -av
cd /opt/tsos/build/buildscript
sudo rm iso/ -rf
sudo bash mktargetiso.sh  squa.livecd  squa.target target.iso

#end
