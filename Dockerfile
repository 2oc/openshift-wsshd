FROM gliderlabs/alpine:3.4
MAINTAINER Joeri van Dooren <ure@mororless.be>

COPY app/run.sh /app/run.sh

# python-dev musl-dev libffi-dev openssl-dev py-pip gcc

# https://pkgs.alpinelinux.org/packages?name=php%25&repo=all&arch=x86_64&maintainer=all
RUN apk --update --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ add curl bash openssl python libffi py-geventwebsocket py-gevent py-paramiko py-flask py-websocket-client openssh-client git && \
# pip install websocket-client gevent gevent-websocket paramiko flask && \
mkdir /src && (cd /src; git clone git@github.com:weepee-org/wssh.git; cd wssh; python setup.py) && \
rm -f /var/cache/apk/* && \
chmod a+rx /app/run.sh

# Exposed Port
EXPOSE 5000

WORKDIR /app

ENTRYPOINT ["/app/run.sh"]

# Set labels used in OpenShift to describe the builder images
LABEL io.k8s.description="Alpine linux based websocket sshd server" \
      io.k8s.display-name="alpine wsshd" \
      io.openshift.expose-services="5000:http" \
      io.openshift.tags="builder,websocket,sshd" \
      io.openshift.non-scalable="true"
