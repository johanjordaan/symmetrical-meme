#!/bin/bash

VERSION=0.12
SRC_DIR=./src/director
DEB_DIR=./deb/director
BUILD_DIR=./build/symmetrical-meme-director.$VERSION

rm -Rf $BUILD_DIR
mkdir -p $BUILD_DIR

mkdir -p $BUILD_DIR/DEBIAN
cp $DEB_DIR/control $BUILD_DIR/DEBIAN/control
cp $DEB_DIR/preinst $BUILD_DIR/DEBIAN/preinst
cp $DEB_DIR/postinst $BUILD_DIR/DEBIAN/postinst
cp $DEB_DIR/postrm $BUILD_DIR/DEBIAN/postrm

mkdir -p $BUILD_DIR/usr/local/sbin/symmetrical-meme-director
cp $SRC_DIR/director.py $BUILD_DIR/usr/local/sbin/symmetrical-meme-director
cp $SRC_DIR/director_config_template.py $BUILD_DIR/usr/local/sbin/symmetrical-meme-director/director_config_template.py
cp $SRC_DIR/create_db.py $BUILD_DIR/usr/local/sbin/symmetrical-meme-director
cp $SRC_DIR/db.py $BUILD_DIR/usr/local/sbin/symmetrical-meme-director

mkdir -p $BUILD_DIR/etc/systemd/system
cp $DEB_DIR/symmetrical-meme-director.service $BUILD_DIR/etc/systemd/system

dpkg-deb --build --root-owner-group $BUILD_DIR

