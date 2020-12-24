#!/bin/bash
# Adds routes to Eve and Bob and enables routing in Eve

vagrant ssh eve -c "sudo ip route add 192.168.0.0/24 via 10.10.10.3"
vagrant ssh alice -c "sudo sysctl -w net.ipv4.ip_forward=1"
vagrant ssh bob -c "sudo ip route add 10.10.10.0/24 via 192.168.0.2"

echo Testing connectivity:

vagrant ssh eve -c "ping 192.168.0.3 -c 5"
