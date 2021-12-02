#!/bin/bash

rm -Rf ./build/agent
mkdir -p ./build/agent

mkdir -p ./build/agent/DEBIAN
cp control-agent ./build/agent/DEBIAN/control
cp preinst-agent ./build/agent/DEBIAN/preinst
cp postinst-agent ./build/agent/DEBIAN/postinst


mkdir -p ./build/agent/usr/local/sbin/symmetrical-meme-agent
cp agent.py ./build/agent/usr/local/sbin/symmetrical-meme-agent
cp __remove-agent.sh ./build/agent/usr/local/sbin/symmetrical-meme-agent
cp agent_config_template.py ./build/agent/usr/local/sbin/symmetrical-meme-agent/agent_config_template.py



mkdir -p ./build/agent/etc/systemd/system
cp symmetrical-meme-agent.service ./build/agent/etc/systemd/system

dpkg-deb --build --root-owner-group ./build/agent

