AGENT_URL=https://github.com/johanjordaan/symmetrical-meme/releases/download/0.12/symmetrical-meme-agent.0.12.deb
echo $AGENT_URL
TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" $AGENT_URL &&
dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"