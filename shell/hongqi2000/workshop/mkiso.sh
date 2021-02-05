#!/bin/bash
# $Id: mkiso.sh,v 1.6 2010/06/02 08:28:57 zyt Exp $
# 与 SQUA 联合来制作 livecd

ISOBASE=data/iso.tar.bz2
ISOCONFIG=data/isolinux.cfg
KERNEL=data/boot.tar.bz2
SQUA=filesystem.squashfs
OUT=livecd.iso
CHROOT=chroot

if [ "$1" != "" ]; then SQUA=$1; fi
if [ "$2" != "" ]; then OUT=$2; fi

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
[ -f $ISOCONFIG ] && cp $ISOCONFIG $ISO/isolinux/

sudo mkisofs -R -J -b isolinux/isolinux.bin -c isolinux/boot.cat -boot-load-size 4 -no-emul-boot -boot-info-table -o $OUT $ISO/

rm -rf $ISO
set +e
exit
