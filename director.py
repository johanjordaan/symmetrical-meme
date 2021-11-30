#!/usr/bin/env python
import socket
import binascii
import json
import time

import db


def main():
    MCAST_GRP = '224.1.1.1'
    MCAST_PORT = 5123
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, socket.IPPROTO_UDP)
    try:
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    except AttributeError:
        pass
    sock.setsockopt(socket.IPPROTO_IP, socket.IP_MULTICAST_TTL, 32)
    sock.setsockopt(socket.IPPROTO_IP, socket.IP_MULTICAST_LOOP, 1)

    sock.bind((MCAST_GRP, MCAST_PORT))
    host = socket.gethostbyname(socket.gethostname())
    sock.setsockopt(socket.SOL_IP, socket.IP_MULTICAST_IF, socket.inet_aton(host))
    sock.setsockopt(socket.SOL_IP, socket.IP_ADD_MEMBERSHIP, socket.inet_aton(MCAST_GRP) + socket.inet_aton(host))

    while 1:
        try:
            data, _ = sock.recvfrom(1024)
            msg = json.loads(data.decode())
            if msg['type'] == 'heartbeat':
                print('Heartbeet -', msg['hostname'])
                db.add_heartbeat(msg)
        except socket.error as e:
            print(e)


if __name__ == '__main__':
    main()
