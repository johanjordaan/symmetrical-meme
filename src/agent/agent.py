#!/usr/bin/python3
import socket
import time
from datetime import datetime
import json
import agent_config
import requests
import logging

import skills.heartbeat as heartbeat
import skills.cpu as cpu


logging.basicConfig(format='%(asctime)s %(levelname)s %(message)s', level=logging.INFO)


try:
    while True:
        hostname = socket.gethostname()
        formatted_date = datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S')
        gap = agent_config.gap

        events = []
        events += heartbeat.run(hostname, formatted_date, gap)
        events += cpu.run(hostname, formatted_date, gap)

        msg = json.dumps(events)

        try:
            res = requests.post(f"http://{agent_config.master_url}:{agent_config.master_port}/events", json=msg)
            if not res.ok:
                logging.error(res.json())
        except Exception as e:
            logging.error(e)

        time.sleep(gap)

except KeyboardInterrupt:
    pass
finally:
    pass
