#!/bin/bash

BUILD_DIR=./build/symmetrical-meme-director

rm -Rf $BUILD_DIR
mkdir -p $BUILD_DIR

mkdir -p $BUILD_DIR/DEBIAN
cp control-director $BUILD_DIR/DEBIAN/control
cp preinst-director $BUILD_DIR/DEBIAN/preinst
cp postinst-director $BUILD_DIR/DEBIAN/postinst
cp postrm-director $BUILD_DIR/DEBIAN/postrm

mkdir -p $BUILD_DIR/usr/local/sbin/symmetrical-meme-director
cp director.py $BUILD_DIR/usr/local/sbin/symmetrical-meme-director
cp director_config_template.py $BUILD_DIR/usr/local/sbin/symmetrical-meme-director/director_config_template.py
cp create_db.py $BUILD_DIR/usr/local/sbin/symmetrical-meme-director
cp db.py $BUILD_DIR/usr/local/sbin/symmetrical-meme-director

mkdir -p $BUILD_DIR/etc/systemd/system
cp symmetrical-meme-director.service $BUILD_DIR/etc/systemd/system

dpkg-deb --build --root-owner-group $BUILD_DIR

