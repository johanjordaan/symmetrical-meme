## symmetrical-meme

A super light weight distributed event producer and logger framework. 

Running on debian platform with python3 installed.

# Install dependencies
```
sudo apt install python3 python3-pip -y
```

# Install agent
```
wget -O install_agent.sh https://github.com/johanjordaan/symmetrical-meme/raw/0.12/scripts/install_agent.sh
chmod +x install_agent.sh && sudo ./install_agent.sh
```

# Update agent config
```
sudo nano /usr/local/sbin/symmetrical-meme-agent/agent_config.py
sudo systemctl restart symmetrical-meme-agent.service
```

# Install director
```
wget -O install_director.sh https://github.com/johanjordaan/symmetrical-meme/raw/0.12/scripts/install_director.sh
chmod +x install_director.sh && sudo ./install_director.sh
```
