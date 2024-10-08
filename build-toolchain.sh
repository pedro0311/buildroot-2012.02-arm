#!/bin/bash

make clean
make

ret=$?
[ $ret -ne 0 ] && {
	echo -e "\nAn error occurred while building the toolchain!\n\n"
} || {
	FILES=./dl_save/files
	HERE=$(pwd)
	TOOLCHAIN=./output/host/hndtools-arm-linux-2.6.36-uclibc-4.5.3
	SYSROOT=$TOOLCHAIN/arm-brcm-linux-uclibcgnueabi/sysroot

	cd $TOOLCHAIN
	ln -sf arm-brcm-linux-uclibcgnueabi arm-linux
	ln -sf arm-linux/sysroot/usr usr
	cd $HERE

	rm -f $TOOLCHAIN/lib/libgmp.*
	rm -f $TOOLCHAIN/lib/libiberty.a
	rm -f $TOOLCHAIN/lib/libc.a

	cp -f $FILES/fixed/in.h $SYSROOT/usr/include/netinet/in.h
	cp -f $FILES/pps/timepps.h $SYSROOT/usr/include/timepps.h

	echo -e "\nToolchain successfully built!\n\n"
}

exit $ret
