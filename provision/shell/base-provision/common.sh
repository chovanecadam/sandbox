#!/bin/bash

ssh-keyscan -H alice >> ~/.ssh/known_hosts
ssh-keyscan -H bob   >> ~/.ssh/known_hosts
ssh-keyscan -H eve   >> ~/.ssh/known_hosts

ssh-keyscan -H 10.10.10.2    >> ~/.ssh/known_hosts
ssh-keyscan -H 10.10.10.3    >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.2   >> ~/.ssh/known_hosts
ssh-keyscan -H 192.168.0.3   >> ~/.ssh/known_hosts
