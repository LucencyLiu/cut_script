#!/bin/bash
# $Id: sv.sh,v 1.11 2010/06/25 07:54:58 zyt Exp $
# 增强 sv.sh 版，使得能在工作目录中对其它目录进行备份操作，加修正路径的操作
# 改用 cp -a 来做。只盖写且避免了移动盖写的区域。
# DIR 指定 LST 表的路径
# LST 是以 DIR 目录中看到的样子的相对路径文件名
# OBJ 临时缓冲用的工作目录
# MOD 指定目录找或 ls 找，为 dir 时只找目录，修改时注意被包含的目录应该删去，默认用 ls 已够
# REL 指定制作 tar 包时按相对路径，而不是直接对 OBJ 进行打包
# CLN 清空临时缓冲区，有时不希望把它清空时有用了

DIR=.
LST=listname
OBJ=pub
MOD=ndir
REL=yes
CLN=yes
TAR=yes

cd $DIR; SD=`pwd`; cd -

if [ ! -f $LST ]; then
	if [ "$MOD" = "dir" ]; then
		find $DIR -type d -print | sed -e "s|^$SD/||; s|^$SD$||; /^$/d" > $LST
		echo "$LST 文件列出的是目录名，要删去被包含的目录，且只保留想备份的目录名，确认后再执行本脚本"
        else
                ls $DIR | sed -e "s|^$SD/||; s|^$SD$||; /^$/d" > $LST
		echo "$LST 文件是要仔细核对和修改的，只保留想备份的目录或文件名，确认后再执行本脚本"
        fi
	exit
fi

if [ ! -d $OBJ ]; then
	mkdir $OBJ
else
	if [ "$CLN" = "yes" ]; then rm -rf $OBJ/*; fi
fi

sed -e "/^#/d; /^[ \t]*$/d" $LST | sed -e "s|^|$SD/|" | while read line; do
	if [ "$REL" = "yes" ]; then
		BL=`dirname $line | sed -e "s|^$SD|$OBJ|"`
		if [ ! -d $BL ]; then mkdir -p $BL; fi
		cp -a $line $BL
	else
		if [ ! -d $line ]; then
			BL=`dirname $line`
			if [ ! -d $OBJ$BL ]; then mkdir -p $OBJ$BL; fi
			cp -a $line $OBJ$BL
		else
			if [ ! -d $OBJ$line ]; then mkdir -p $OBJ$line; fi
			cp -a $line/* $OBJ$line
		fi
	fi
done

if [ "$TAR" = "yes" ]; then
	BL=`LANG=C; export $LANG; date +%Y-%m%d-%H%M%S`
	cd $OBJ
	tar cvf ../bkp$OBJ$BL.tar *
	cd -
	echo "结果是 bkp$OBJ$BL.tar"
else
	echo "结果在 $OBJ 目录中"
fi
exit
