#!/bin/bash
for i in media*
do

VERSION=$( grep Version: $i/DEBIAN/control | cut -d' ' -f2 )
ARCH=$( grep Architecture: $i/DEBIAN/control | cut -d' ' -f2 )
PACKAGE_NAME=${i}_${VERSION}_${ARCH}.deb
dpkg-deb -b $i $PACKAGE_NAME

done
