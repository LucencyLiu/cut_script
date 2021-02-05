#!/bin/bash
# $Id: mkbase.sh,v 1.2 2010/05/26 02:52:54 zyt Exp $\
# 利用 apt-get 制作一个基本系统，并得到一个 tar 归档便于随时恢复原样
# 基于的裁剪系统起步的样子，一般开始时做，之后不太变了

CHROOT=chroot
TARBZ=base.tar.bz2
DATADIR=data

mount -t tmpfs none chroot
debootstrap lucid chroot http://172.16.24.227/mirror/ubuntu

chroot $CHROOT apt-get clean

cd $CHROOT/

tar cjf ../$DATADIR/$TARBZ *

cd -

chown `whoami`.`whoami` $DATADIR/$TARBZ

umount -l chroot

exit
