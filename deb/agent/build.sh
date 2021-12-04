#!/bin/bash

VERSION=0.12
SRC_DIR=./src/agent
DEB_DIR=./deb/agent
BUILD_DIR=./build/symmetrical-meme-agent.$VERSION

rm -Rf $BUILD_DIR
mkdir -p $BUILD_DIR

mkdir -p $BUILD_DIR/DEBIAN
cp $DEB_DIR/control $BUILD_DIR/DEBIAN/control
cp $DEB_DIR/preinst $BUILD_DIR/DEBIAN/preinst
cp $DEB_DIR/postinst $BUILD_DIR/DEBIAN/postinst
cp $DEB_DIR/postrm $BUILD_DIR/DEBIAN/postrm


mkdir -p $BUILD_DIR/usr/local/sbin/symmetrical-meme-agent
cp $SRC_DIR/agent.py $BUILD_DIR/usr/local/sbin/symmetrical-meme-agent
cp $SRC_DIR/agent_config_template.py $BUILD_DIR/usr/local/sbin/symmetrical-meme-agent/agent_config_template.py
cp -R $SRC_DIR/skills $BUILD_DIR/usr/local/sbin/symmetrical-meme-agent/

mkdir -p $BUILD_DIR/etc/systemd/system
cp $DEB_DIR/symmetrical-meme-agent.service $BUILD_DIR/etc/systemd/system

dpkg-deb --build --root-owner-group $BUILD_DIR

