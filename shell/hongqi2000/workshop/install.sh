#!/bin/bash
# $Id: install.sh,v 1.3 2010/06/02 06:48:08 zyt Exp $
# 安装

CHROOT=chroot
LIST=install_list_deb
SRC=data/sources.list

if [ ! -f "$LIST" ]; then
	exit 0
else
	BL=`sed -e "/^#/d; /^[ \t]*$/d" ${LIST}`
	if [ "$BL" = "" ]; then
		exit 0
	fi
fi

[ -f $SRC ] && cp $SRC $CHROOT/etc/apt
chroot $CHROOT/ apt-get update
chroot $CHROOT/ bash -c "cat >/tmp/TMP<<EOF
Y
y
EOF"

# install
for f in `sed -e "/^#/d; /^[ \t]*$/d" ${LIST}`; do
	chroot $CHROOT/ bash -c "aptitude install $f < /tmp/TMP"
done

chroot $CHROOT/ dpkg --configure -a
chroot $CHROOT/ apt-get clean

rm $CHROOT/tmp/TMP
# End of File
