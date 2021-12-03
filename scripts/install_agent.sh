VERSION=0.3
AGENT_URL=http://path.to/my$VERSION.deb
echo $AGENT_URL
#TEMP_DEB="$(mktemp)" &&
#wget -O "$TEMP_DEB" $AGENT_URL &&
#dpkg -i "$TEMP_DEB"
#rm -f "$TEMP_DEB"