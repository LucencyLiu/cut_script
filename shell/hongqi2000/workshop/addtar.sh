#!/bin/bash
# $Id: addtar.sh,v 1.1 2010/06/02 02:15:18 zyt Exp $
# 按照 addtar.list 所列的文件，抽取文件到 CHROOT 目录中去

ADDTAR=addtar.list
CHROOT=chroot

if [ ! -f "$ADDTAR" ]; then
	exit 0
else
	BL=`sed -e "/^#/d; /^[ \t]*$/d" $ADDTAR`
	if [ "$BL" = "" ]; then
		exit 0
	fi
fi
> addtar.err
sed -e "/^#/d; /^[ \t]*$/d" $ADDTAR | while read line; do
	if [ ! -f $line ]; then
		echo "$line 文件不存在" >> addtar.err
	else
		cd $CHROOT; tar xvf $line; cd -
	fi
done
if [ -s addtar.err ]; then
	echo "列表中的 $line 文件不存在，见 addtar.err 文件"
	exit 1
else
	rm addtar.err
	exit 0
fi

chroot chroot chmod u+s /sbin/poweroff
chroot chroot chmod u+s /sbin/shutdown
# End of file

