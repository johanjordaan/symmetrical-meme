#!/usr/bin/bash

supervisorctl stop symmetrical-meme-agent
rm /etc/supervisor/conf.d/symmetrical-meme-agent.conf
deluser symmetrical-meme-agent
rm -Rf /usr/local/sbin/symmetrical-meme-agent
supervisorctl reload