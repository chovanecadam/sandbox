#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ${DIR}/../
export PYTHONUNBUFFERED=1
ansible-playbook -i inventory.yml provision/ansible/playbook.yml $*
