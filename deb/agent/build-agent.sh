#!/bin/bash

BUILD_DIR=./build/symmetrical-meme-agent

rm -Rf $BUILD_DIR
mkdir -p $BUILD_DIR

mkdir -p $BUILD_DIR/DEBIAN
cp control-agent $BUILD_DIR/DEBIAN/control
cp preinst-agent $BUILD_DIR/DEBIAN/preinst
cp postinst-agent $BUILD_DIR/DEBIAN/postinst
cp postrm-agent $BUILD_DIR/DEBIAN/postrm


mkdir -p $BUILD_DIR/usr/local/sbin/symmetrical-meme-agent
cp agent.py $BUILD_DIR/usr/local/sbin/symmetrical-meme-agent
cp agent_config_template.py $BUILD_DIR/usr/local/sbin/symmetrical-meme-agent/agent_config_template.py


mkdir -p $BUILD_DIR/etc/systemd/system
cp symmetrical-meme-agent.service $BUILD_DIR/etc/systemd/system

dpkg-deb --build --root-owner-group $BUILD_DIR

