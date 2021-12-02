#!/bin/bash

# Add user
#
useradd symmetrical-meme-director

# Copy files
#
mkdir -p /usr/local/sbin/symmetrical-meme-director
cp director.py /usr/local/sbin/symmetrical-meme-director
cp __remove-director.sh /usr/local/sbin/symmetrical-meme-director
cp create_db.py /usr/local/sbin/symmetrical-meme-director
cp db.py /usr/local/sbin/symmetrical-meme-director
cp symmetrical-meme-director.service /etc/systemd/system
chown -R symmetrical-meme-director /usr/local/sbin/symmetrical-meme-director


# Install dependencies
#
/usr/bin/pip3 install mysql-connector-python --target /usr/local/sbin/symmetrical-meme-director --upgrade
/usr/bin/pip3 install flask --target /usr/local/sbin/symmetrical-meme-director --upgrade
/usr/bin/pip3 install gevent --target /usr/local/sbin/symmetrical-meme-director --upgrade


# Allow user to edit config file
#
CONFIG_FILE=/usr/local/sbin/symmetrical-meme-director/director_config.py
if [ -f "$CONFIG_FILE" ]
then
    echo "$CONFIG_FILE already exists."
    read -p "Replace with new config ? [Y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      echo "Copying config file to $CONFIG_FILE"
      cp director_config.py /usr/local/sbin/symmetrical-meme-director
    fi
else
  echo "Copying config file to $CONFIG_FILE"
  cp director_config.py /usr/local/sbin/symmetrical-meme-director
fi

nano /usr/local/sbin/symmetrical-meme-director/director_config.py
chown -R symmetrical-meme-director /usr/local/sbin/symmetrical-meme-director


#python3 create_db.py

systemctl daemon-reload
systemctl start symmetrical-meme-director.service

echo "Done installing symmetrical-meme-director"

