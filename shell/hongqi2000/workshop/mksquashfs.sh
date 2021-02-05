#!/bin/bash
# $Id: mksquashfs.sh,v 1.1 2010/05/25 03:45:46 zyt Exp $

CHROOT=chroot
OUT=filesystem.squashfs

if [ "$2" != "" ]; then OUT=$2; fi

sudo mksquashfs $CHROOT/ $OUT -noappend
exit
