DIRECTOR_URL=https://github.com/johanjordaan/symmetrical-meme/releases/download/0.11/symmetrical-meme-director.0.11.deb
echo $DIRECTOR_URL
TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" $DIRECTOR_URL &&
dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"