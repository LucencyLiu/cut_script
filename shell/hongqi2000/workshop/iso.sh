#cp ../obj.t/* ./ -av

#tar xvf data/base.tar.bz2 -C chroot

#./install.sh

#./rmact.sh

#./addtar.sh

#./adduser.sh

./mksquashfs.sh

cd /opt/tsos/build/buildscript
cp /opt/tsos/build/buildscript/obj.l/* /opt/tsos/build/buildscript/workshop -a
echo "cp workshop/filesystem.squashfs squa.target"
#echo "cp workshop/filesystem.squashfs squa.livecd"

cp workshop/filesystem.squashfs squa.target
./mktargetiso.sh squa.livecd squa.target target.iso
./scp.sh
