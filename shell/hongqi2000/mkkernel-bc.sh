#!/bin/bash


KDIR=/opt/tsos/build/kernel
KVERSION=2.6.32.9-grsec

CURDIR=$PWD
objdir=
m_tar=data/modules.tar.bz2
b_tar=data/boot.tar.bz2

TARGET=$1

[ $TARGET = boot ] && objdir=obj.t
[ $TARGET = livecd ] && objdir=obj.l

[ -z $objdir ] && exit 1

r_f=$KDIR/lib_$TARGET/lib/modules/$KERVERSION/moduels.dep

[ $TARGET = boot ] && cp -a /opt/tsos/build/$TARGET/system/* /opt/tsos/build/$TARGET/initramfs/

make -C $KDIR $TARGET

cd $KDIR/lib_$TARGET/
	tar cjf $CURDIR/$objdir/$m_tar *
cd -


[ -d "iso" ] || mkdir iso 

mount -t tmpfs none iso

mkdir -p iso/casper 
[ $TARGET = livecd ] && mkdir -p iso/boot/casper

cp $KDIR/build_$TARGET/arch/x86/boot/bzImage iso/casper
[ $TARGET = livecd ] && cp $KDIR/build_boot/arch/x86/boot/bzImage iso/boot/casper/tboot
tar cjf $objdir/$b_tar iso/*

umount iso

rmdir iso

