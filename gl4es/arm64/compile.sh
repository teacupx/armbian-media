#!/bin/bash
set -e
rm -rf gl4es
git clone https://github.com/ptitSeb/gl4es
mkdir -p gl4es/build package/usr/lib/aarch64-linux-gnu ../../output
cd gl4es/build
cmake .. -DODROID=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DDEFAULT_ES=2 -DGBM=1 -DCMAKE_C_FLAGS="-O2 -march=armv8-a -mtune=cortex-a53"
make -j$(nproc --all)
cd ../..
cp gl4es/lib/libGL.so.1 package/usr/lib/aarch64-linux-gnu/
dpkg-deb -b package ../../output/gl4es_1.1.5-0armbian1_arm64.deb
rm -rf gl4es package/usr