# Sandbox

My first objective is to create a simple network of three hosts
connected to each other. Only the first host should have internet
access. Two other hosts shouldn't have vagrant's 10.0.2.15 interface,
user or anything else. Configure it's connection through root and 
ssh conf files.

```  
|-----|               |-----|                |-----|
|     |               |     |                |     |
|  1  | 10.10.10.0/24 |  2  | 192.168.0.0/24 |  3  |
|     | < --------- > |     | < ---------- > |     |
|-----|               |-----|                |-----|
```
