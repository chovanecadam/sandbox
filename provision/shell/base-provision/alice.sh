#!/bin/bash
 
echo "10.10.10.2    eve" >> /etc/hosts
echo "192.168.0.3   bob" >> /etc/hosts
ip route del default

ln -s /usr/bin/python3 /usr/bin/python
mkdir /srv/http
echo "Website reachable only from localhost" > /srv/http/index.html
python -m http.server --bind 127.0.0.1 -d /srv/http/ 80 &
