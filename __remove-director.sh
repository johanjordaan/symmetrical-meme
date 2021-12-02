#!/bin/bash
systemctl stop symmetrical-meme-director
rm /etc/systemd/system/symmetrical-meme-director.service
systemctl daemon-reload
deluser symmetrical-meme-director
rm -Rf /usr/local/sbin/symmetrical-meme-director
systemctl daemon-reload