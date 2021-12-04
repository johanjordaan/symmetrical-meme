#!/usr/bin/python3
import socket
import time
from datetime import datetime, timedelta
import json
import agent_config
import requests
import logging

import skills.heartbeat as heartbeat
import skills.cpu as cpu


logging.basicConfig(format='%(asctime)s %(levelname)s %(message)s', level=logging.INFO)

gap = agent_config.gap

lastnow = datetime.utcnow()-timedelta(seconds=gap)
try:
    while True:
        now = datetime.utcnow()
        delta = (now - lastnow).seconds
        if delta >= gap:
            lastnow = now

            hostname = socket.gethostname()
            formatted_date = datetime.utcnow().strftime('%Y-%m-%d %H:%M:%S')

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
        else:
            time.sleep(0.1)

except KeyboardInterrupt:
    pass
finally:
    pass
