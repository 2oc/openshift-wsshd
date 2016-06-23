#!/bin/bash -x

echo "oc:x:`id -u`:0:oc:/:/sbin/nologin" >> /etc/passwd

cd /app

sleep 7d
