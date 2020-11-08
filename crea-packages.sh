#!/bin/bash
#
# Compiles all packages, and saves them to output/
#
mkdir -p output
rm -rf output/*

for i in metapackages/* libmali/*
do
  PACKAGENAME=$( grep Package: $i/DEBIAN/control | cut -d' ' -f2 )
  VERSION=$( grep Version: $i/DEBIAN/control | cut -d' ' -f2 )
  ARCH=$( grep Architecture: $i/DEBIAN/control | cut -d' ' -f2 )
  PACKAGE_NAME=${PACKAGENAME}_${VERSION}_${ARCH}.deb
  dpkg-deb -b $i output/$PACKAGE_NAME
done

#for i in libmali/*
#do
#  PACKAGENAME=$( grep Package: $i/DEBIAN/control | cut -d' ' -f2 )
#  VERSION=$( grep Version: $i/DEBIAN/control | cut -d' ' -f2 )
#  ARCH=$( grep Architecture: $i/DEBIAN/control | cut -d' ' -f2 )
#  PACKAGE_NAME=${PACKAGENAME}_${VERSION}_${ARCH}.deb
#  dpkg-deb -b $i output/$PACKAGE_NAME
#done
