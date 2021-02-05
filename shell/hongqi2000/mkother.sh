#!/bin/bash

TARGET=$1

BUILDDIR=/opt/tsos/build
CURDIR=$BUILDDIR/buildscript


if [ $TARGET = livecd ]; then
	cd $BUILDDIR/livecd/system
	tar cjfv $CURDIR/obj.l/other/livecd.tar.bz2 *
	cd -
	cd $BUILDDIR/boot/system
	tar cjfv $CURDIR/obj.l/other/tsos.tar.bz2 etc/tsos/*
	cd -
elif [ $TARGET = target -o $TARGET = boot ]; then
	cd $BUILDDIR/target/system
	tar cjfv $CURDIR/obj.t/other/target.tar.bz2 *
	cd -
	cd $BUILDDIR/boot/system
	tar cjfv $CURDIR/obj.t/other/tsos.tar.bz2 etc/tsos/*
	cd -

fi


