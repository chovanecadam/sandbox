#!/bin/bash

echo "192.168.0.2   alice" >> /etc/hosts
echo "10.10.10.2    eve" >> /etc/hosts

ln -s /usr/bin/python3 /usr/bin/python
mkdir /srv/http
echo "Bob's website reachable only from internal network" > /srv/http/index.html
ip route del default
python -m http.server --bind 127.0.0.1 -d /srv/http/ 80 &

