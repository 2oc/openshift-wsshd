FROM gliderlabs/alpine:3.4
MAINTAINER Joeri van Dooren <ure@mororless.be>

# https://pkgs.alpinelinux.org/packages?name=php%25&repo=all&arch=x86_64&maintainer=all
RUN apk --update add curl bash openssl python ssh sshd && rm -f /var/cache/apk/*

# Exposed Port
EXPOSE 5000

WORKDIR /

ENTRYPOINT ["/bin/bash"]

# Set labels used in OpenShift to describe the builder images
LABEL io.k8s.description="Alpine linux based websocket sshd server" \
      io.k8s.display-name="alpine wsshd" \
      io.openshift.expose-services="5000:http" \
      io.openshift.tags="builder,websocket,sshd" \
      io.openshift.non-scalable="true"
