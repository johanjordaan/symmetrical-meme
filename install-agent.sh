#!/bin/bash
set -e

useradd symmetrical-meme-agent
mkdir -p /usr/local/sbin/symmetrical-meme-agent
cp agent.py /usr/local/sbin/symmetrical-meme-agent
cp agent_config.py /usr/local/sbin/symmetrical-meme-agent
cp __remove-agent.sh /usr/local/sbin/symmetrical-meme-agent
cp symmetrical-meme-agent.conf /etc/supervisor/conf.d
supervisorctl reload
