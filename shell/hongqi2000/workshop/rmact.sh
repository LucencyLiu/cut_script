#!/bin/bash
# $Id$
# 删除目录 DIR 中 LIST 文件中列出的那些文件，这是个工作文件
# LIST 中是全路径文件名，DIR 一般与 / 同构
# 典型用于裁剪系统时删除 chroot 目录中不要的文件
# 一般在 tar xvf 抽取基本系统到 DIR 后执行本脚本
# LIST 可以放目录名，将把目录删除，放目录名时要谨慎

LIST=remove_list_file
DIR=chroot

if [ ! -f $LIST ]; then
	exit 0
else
	BL=`sed -e "/^#/d; /^[ \t]*$/d" $LIST`
	if [ "$BL" = "" ]; then
		exit 0
	fi
fi

sed -e "/^#/d; /^[ \t]*$/d" $LIST | while read line; do
	file="$DIR$line"
	[ -d "$file" ] && rm -rf "$file" || echo [E] $DIR$line
	[ -e "$file" ] && rm -f "$file" || echo [E] $DIR$line
done
exit
