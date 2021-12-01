#!/bin/bash
set -e

mkdir -p /usr/local/sbin/symmetrical-meme-director
cp director.py /usr/local/sbin/symmetrical-meme-director
cp director_config.py /usr/local/sbin/symmetrical-meme-director
cp __remove-director.sh /usr/local/sbin/symmetrical-meme-director
cp create_db.py /usr/local/sbin/symmetrical-meme-director
cp db.py /usr/local/sbin/symmetrical-meme-director

/usr/bin/pip3 install mysql-connector-python --target /usr/local/sbin/symmetrical-meme-director --upgrade

useradd symmetrical-meme-director

cp symmetrical-meme-director.conf /etc/supervisor/conf.d
/usr/bin/python3 /usr/local/sbin/symmetrical-meme-director/create_db.py
supervisorctl reload
