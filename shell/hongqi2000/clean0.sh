#!/bin/bash
#

DIR=workshop

tar cvf /dev/null $DIR/iso $DIR/data $DIR/other &> ttmm0_
sed -e "/\/$/d; /README/d; s|^$DIR/||; /base.tar.bz2$/d" ttmm0_ | sort -u | while read line; do
	rm -rf $DIR/$line
done
tar cvf /dev/null $DIR/iso $DIR/data $DIR/other
rm ttmm0_
exit


tar cvf /dev/null obj.t/ obj.l/ &> ttmm0
cd $DIR; make clean; cd -
rm $DIR/Makefile > ttmm

