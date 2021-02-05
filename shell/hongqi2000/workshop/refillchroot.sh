#!/bin/bash
# $Id: refillchroot.sh,v 1.3 2010/06/04 02:51:03 zyt Exp $
# 重新制作 chroot 目录到 TO 指定的那一步
# 用执行的时间换空间
# OPS 的次序是按过程而定，不能随便改变，只能随过程而变

TO=0
OPS="0 1 2 3"

if [ "$1" != "" ]; then TO=$1; fi

rm chroot/* -rf
for i in $OPS; do
	case "$i" in
		"0" )
			bash crt_0.sh
			;;
		"1" )
			bash install.sh
			;;
		"2" )
			bash rmact.sh
			;;
		"3" )
			bash addtar.sh
			;;
	esac
	if [ "$TO" = "$i" ]; then
		echo "本次从 0 状态直到 $TO 状态"
		break
	fi
done
exit
# End of file
