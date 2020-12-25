apt-get install nmap -y

echo "10.10.10.3    alice" >> /etc/hosts
echo "10.10.10.2    eve" >> /etc/hosts
echo "192.168.0.3   bob" >> /etc/hosts

# Goal: connect to services accessible only from Alice's localhost
# ssh -N -L [bind_address:]port:host:hostport [username@address]

# ssh -N -L 127.0.0.1:8080:127.0.0.1:80 vagrant@alice

# Goal: connect to services accessible only from internal network 192.168.0.0/24

# ssh -N -L 127.0.0.1:8080:192.168.0.3:80 vagrant@alice
