#!/usr/bin/env bash

cp daemon.json /etc/docker/.
systemctl restart docker.service

