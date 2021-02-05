#!/bin/bash
#
# 比较目录 DIR 和 REF 中的文件，适用于结构大体相同的两个目录
# 分别列出 DIR 目录相对于 REF 目录的“相同、改变和特有”的文件名列表
# 只比较而不采取改动性的动作
# 真正的操作可以按所得的结果再定
# 路径由开头部分不同的部分和可能有共同的部分来组成
# RLD 开头部分可能路径不同的部分
# COM 路径有共同的部分

NM=privp.dic
RLD=chroot_2/etc
RLR=chroot-3/etc
COM=

if [ "$COM" = "" ]; then
	DIR=$RLD
	REF=$RLR
else
	DIR=$RLD/$COM
	REF=$RLR/$COM
fi

find $DIR -print | sed -e "s|^${DIR}/||" > ttmm1
find $DIR -type d -print | sed -e "s|^${DIR}/||" | ztransed ttmm1 - -v > ttmm2

find $REF -print | sed -e "s|^${REF}/||" > ttmm3
find $REF -type d -print | sed -e "s|^${REF}/||" | ztransed ttmm3 - -v > ttmm4
> kkk1
> kkk2
ztransed ttmm2 ttmm4 -r ttmm5 | while read line; do
#	echo $line
        if [ ! -d $DIR/$line -a ! -d $REF/$line ]; then
	        diff $DIR/$line $REF/$line > /dev/null
		if [ "$?" = "0" ]; then
			echo rm -rf $DIR/$line >> kkk1
		else
			echo $DIR/$line >> kkk2
		fi
	elif [ ! -d $DIR/$line -a -d $REF/$line ]; then
		echo ====$DIR/$line >> kkk2
	fi
done
if [ ! -s kkk1 ]; then
	rm kkk1
#	echo "相对于 REF 目录而言，DIR 目录中没有同名且相同的文件"
else
	echo "kkk1 $DIR 目录中与 $REF 目录中同名且相同的文件名"
fi
if [ ! -s kkk2 ]; then
	rm kkk2
#	echo "相对于 REF 目录而言，DIR 目录中没有同名且不相同的文件"
else
	echo "kkk2 $DIR 目录中与 $REF 目录中同名但不相同的文件名"
fi
if [ -s ttmm5 ]; then
	sed -e "s|^|$DIR/|" ttmm5 > kkk3
	echo "kkk3 $DIR 目录中特有的文件名"
fi
rm ttmm1 ttmm2 ttmm3 ttmm4 ttmm5
exit
