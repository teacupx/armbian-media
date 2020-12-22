#!/bin/bash
rm -rf gl4es
git clone https://github.com/ptitSeb/gl4es
mkdir -p gl4es/build package/usr/lib/arm-linux-gnueabihf ../../output
cd gl4es/build
cmake .. -DODROID=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DDEFAULT_ES=2 -DGBM=1 -DCMAKE_C_FLAGS="-O2 -march=armv7-a -mtune=cortex-a15.cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard"
make -j$(nproc --all)
cd ../..
cp gl4es/lib/libGL.so.1 package/usr/lib/arm-linux-gnueabihf/libGL.so.99
cd package/usr/lib/arm-linux-gnueabihf
ln -s libGL.so.99 libGL.so.1
cd ../../../..
dpkg-deb -b package ../../output/gl4es_1.1.5-0armbian1_armhf.deb
rm -rf gl4es package/usr

