# Sandbox

A simple sandbox to play around.

Alice and Bob aren't connected to internet. Alice has enabled routing.
Bob and Alice have http servers runnig accessible from their localhost.
Each host can ssh to any other host with public key. Also they all have a shared folder with host.

```  
|-------|               |-------|                |-------|
|       |               |       |                |       |
|  eve  | 10.10.10.0/24 | alice | 192.168.0.0/24 |  bob  |
|       | < --------- > |       | < ---------- > |       |
|-------|               |-------|                |-------|
```

## Setup

```
ansible-galaxy collection install -r requirements.yml
cat ssh_config >> ~/.ssh/config
vagrant up
ansible-playbook provision/ansible/playbook.yml
```

## Goals:

1. ssh config for each host, so I can `ssh host` to it, and known-hosts file
2. Add a windows host

## Notes

I chose to provision manually with ansible, because Vagrant doesn't support provisioning in stages. And it's way faster.
