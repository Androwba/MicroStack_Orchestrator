#!/bin/bash

while [ ! -f /vagrant/worker_token.txt ]; do
  sleep 1
done

TOKEN=$(cat /vagrant/worker_token.txt)

sudo docker swarm join --token $TOKEN 192.168.56.10:2377
