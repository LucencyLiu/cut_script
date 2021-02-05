#!/bin/bash
#$Id$
# 制作两个 .squashfs 的 livecd

ISOBASE=workshop/data/iso.tar.bz2
KERNEL=workshop/data/boot.tar.bz2
SQUA=
SQUB=
OUT=target.iso
CHROOT=chroot

if [ "$1" != "" ]; then SQUA=$1; fi
if [ "$2" != "" ]; then SQUB=$2; fi
if [ "$3" != "" ]; then OUT=$3; fi

# 目录应该取决于 ISOBASE
BL=`tar tvf $ISOBASE | sed -e 1q | sed -e "s/.* //; s/\/$//"`
if [ "$BL" != "" ]; then
	ISO=$BL
else
	echo "$ISOBASE 的制作目录有问题!"
	exit
fi
mkdir $ISO
rm $ISO/* -rf || true
set -e

tar xf $ISOBASE -C .
tar xf $KERNEL -C .
cp $SQUA $ISO/casper/filesystem.squashfs
cp $SQUB $ISO/boot/casper/tsos

sudo mkisofs -R -J -b isolinux/isolinux.bin -c isolinux/boot.cat -boot-load-size 4 -no-emul-boot -boot-info-table -o $OUT $ISO/

rm -rf $ISO
set +e
exit
