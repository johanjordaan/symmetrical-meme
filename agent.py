#!/usr/bin/python3
import socket
import time
from datetime import datetime
import json
import agent_config

try:
    while True:
        now = datetime.utcnow()
        formatted_date = now.strftime('%Y-%m-%d %H:%M:%S')
        heartbeat = {
            'type': 'heartbeat',
            'hostname': socket.gethostname(),
            'utcdt': formatted_date
        }
        msg = json.dumps(heartbeat)

        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
        sock.setsockopt(socket.IPPROTO_IP, socket.IP_MULTICAST_TTL, 32)
        sock.sendto(msg.encode(), (agent_config.mcast_grp, agent_config.mcast_port))
        time.sleep(agent_config.interval)

except KeyboardInterrupt:
    pass
finally:
    pass
