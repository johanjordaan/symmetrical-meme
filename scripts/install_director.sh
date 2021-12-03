VERSION=0.4
AGENT_URL="http://path.to/my$VERSION.deb'
TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" $AGENT_URL &&
#dpkg -i "$TEMP_DEB"
#rm -f "$TEMP_DEB"