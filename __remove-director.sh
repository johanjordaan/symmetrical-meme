#!/bin/bash

supervisorctl stop symmetrical-meme-director
rm /etc/supervisor/conf.d/symmetrical-meme-director.conf
deluser symmetrical-meme-director
rm -Rf /usr/local/sbin/symmetrical-meme-director
supervisorctl reload