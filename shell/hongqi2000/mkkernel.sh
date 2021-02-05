#!/bin/bash

target=$1

[ "$target" != "boot" -a "$target" != "livecd" ] && exit 0

idir=$(mktemp -d)
cd /opt/tsos/build/kernel/build_$target
make
make modules_install
make INSTALL_MOD_PATH=/opt/tsos/build/kernel/lib_${target} modules_install
cd -

cd ${idir}
rm -rf *
mkinitramfs -o ${idir}/i.gz 2.6.32.9-grsec
gunzip i.gz
cpio -i < i 
rm i
rm -rf /opt/tsos/build/${target}/initramfs/lib/modules/*
cp lib/modules/* /opt/tsos/build/${target}/initramfs/lib/modules/ -a
cd -

cd /opt/tsos/build/kernel/build_$target
make
cd -

rm -rf ${idir}

