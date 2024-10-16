#!/bin/bash

sudo docker swarm join-token worker | grep docker > /vagrant/scripts/join_command.sh

sudo docker swarm join-token worker -q > /vagrant/worker_token.txt
