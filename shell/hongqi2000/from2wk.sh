#!/bin/bash
# 从源目录同构复制文件到工作目录中去
# 源目录中无符号链接的文件

FROM=obj.t
TO=work

if [ "$1" != "" ]; then FROM=$1; fi
if [ "$2" != "" ]; then TO=$2; fi

LIST=list.wk

find $FROM -name "*" | sed -e "s|^$FROM/||; s|^$FROM$||; /^$/d" > $LIST
sed -e "s/^SDIR=.*/SDIR=$FROM/; s/^LISTNM=.*/LISTNM=$LIST/; s/^OBJ=.*/OBJ=$TO/; s/^CLEAN=.*/CLEAN=no/; s/^TYPE=.*/TYPE=dir/; s/^REL=.*/REL=yes/; s/^TAR=.*/TAR=no/" sv.sh > sv.sh.wk
bash sv.sh.wk
rm sv.sh.wk $LIST
exit

bash from2wk.sh obj.t workshop
