# Sandbox

A simple sandbox to play around.

Alice and Bob aren't connected to internet. Alice has enabled routing.
Bob and Alice have http servers runnig accessible from localhost.
Each host can ssh to any other host with public key.
Also they all share a shared folder with host.

```  
|-----|               |-------|                |-----|
|     |               |       |                |     |
| eve | 10.10.10.0/24 | alice | 192.168.0.0/24 | bob |
|     | < --------- > |       | < ---------- > |     |
|-----|               |-------|                |-----|
```

## Goals:

1. Move to ansible (I wanted to try shell. hell no)
2. Create a playbook for packet and flow capture on Alice
3. Add a windows host
