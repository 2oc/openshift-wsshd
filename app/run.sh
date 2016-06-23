#!/bin/bash

# create working user
echo "oc:x:`id -u`:0:oc:/wssh:/bin/bash" >> /etc/passwd

# run ssh on 2222
/usr/sbin/sshd -p 2222

# diplay private key
cat /wssh/.ssh/key

# start websocket proxy
wsshd
