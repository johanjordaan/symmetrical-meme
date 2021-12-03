#!/usr/bin/python3
import json

import director_config
import db

from flask import Flask, request, jsonify
from gevent.pywsgi import WSGIServer

app = Flask(__name__)

# This needs to be deprecated soon. Here for backward compatibility
#
@app.route('/heartbeat', methods=['POST'])
def heartbeat():
    content = request.json
    event = json.loads(content)
    db.add_event(director_config, event)
    return jsonify({"status": "ok"})


@app.route('/events', methods=['POST'])
def events():
    content = request.json
    events = json.loads(content)
    for event in events:
        db.add_event(director_config, event)
    return jsonify({"status": "ok"})


http_server = WSGIServer(('0.0.0.0', director_config.server_port), app)
http_server.serve_forever()



