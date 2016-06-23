#!/bin/bash -x

echo "oc:x:`id -u`:0:oc:/wssh:/sbin/nologin" >> /etc/passwd

/usr/sbin/sshd -p 2222
wsshd
