cp /opt/qtxtview /opt/tsos/build/buildscript/workshop/chroot/usr/share/tsos/qtxtview/ 

cp /opt/qtxtview /opt/tsos/build/buildscript/workshop/chroot/usr/bin/ 

./mksquashfs.sh

cd /opt/tsos/build/buildscript

cp workshop/filesystem.squashfs squa.target

./mktargetiso.sh squa.livecd squa.target target.iso



