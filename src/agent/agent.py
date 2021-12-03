#!/usr/bin/python3
import socket
import time
from datetime import datetime
import json
import agent_config
import requests
import logging

logging.basicConfig(format='%(asctime)s %(levelname)s %(message)s',level=logging.INFO)

try:
    while True:
        now = datetime.utcnow()
        formatted_date = now.strftime('%Y-%m-%d %H:%M:%S')
        heartbeat = {
            'type': 'heartbeat',
            'hostname': socket.gethostname(),
            'gap': agent_config.gap,
            'utcdt': formatted_date,
            'value': 1,
        }
        msg = json.dumps(heartbeat)

        try:
            res = requests.post(f"http://{agent_config.master_url}:{agent_config.master_port}/heartbeat", json=msg)
            if not res.ok:
                logging.error(res.json())
        except Exception as e:
            logging.error(e)

        time.sleep(agent_config.gap)

except KeyboardInterrupt:
    pass
finally:
    pass
