import socket
import time
from datetime import datetime
import json

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

        MCAST_GRP = '224.1.1.1'
        MCAST_PORT = 5123
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
        sock.setsockopt(socket.IPPROTO_IP, socket.IP_MULTICAST_TTL, 32)
        sock.sendto(msg.encode(), (MCAST_GRP, MCAST_PORT))

        time.sleep(5)

except KeyboardInterrupt:
    pass
finally:
    pass
