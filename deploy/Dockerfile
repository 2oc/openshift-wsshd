FROM weepee-registry/wssh

RUN echo -e  'y\n'| ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa && \
echo -e  'y\n'| ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa && \
echo -e  'y\n'| ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa && \
echo -e  'y\n'| ssh-keygen -f /etc/ssh/ssh_host_ed25519_key   -N '' -t ed25519 && \
echo -e  'y\n'| ssh-keygen -f /wssh/.ssh/key -P '' && \
cat /wssh/.ssh/key.pub > /wssh/.ssh/authorized_keys && \
chmod a+r /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key  /etc/ssh/ssh_host_ecdsa_key /etc/ssh/ssh_host_ed25519_key /wssh/.ssh/authorized_keys
