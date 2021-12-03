#!/usr/bin/python3
import json

import director_config
import db

from flask import Flask, request, jsonify
from gevent.pywsgi import WSGIServer

app = Flask(__name__)

@app.route('/')
def hallo():
    return '<h1>Hallo2</h1>'


@app.route('/heartbeat', methods=['POST'])
def heartbeat():
    content = request.json
    msg = json.loads(content)
    db.add_event(director_config, msg)
    return jsonify({"status": "ok"})

http_server = WSGIServer(('0.0.0.0', director_config.server_port), app)
http_server.serve_forever()



