## symmetrical-mem

# Download and extract 
```
wget https://github.com/johanjordaan/symmetrical-meme/archive/refs/heads/master.zip && unzip master.zip && cd symmetrical-meme-master
```

# Install agent
```
nano agent_config.py
```

```
sudo ./install-agent.sh
```

```
sudo supervisorctl status
```

# Install director
```
nano  director_config.py
```

```
sudo ./install-director.sh
```

```
sudo supervisorctl status
```
