FROM      debian:wheezy
#FROM      ubuntu:precise
MAINTAINER Brian Murphy-Dye <brian@murphydye.com>

# Do not restart sshd causing the container to exit
# Install ssh, curl and locales
RUN printf '#!/bin/sh\nexit 101\n' > /usr/sbin/policy-rc.d && \
    chmod +x /usr/sbin/policy-rc.d && \
    apt-get update && \
    apt-get install -y openssh-server curl locales && \
    apt-get clean

# Generate and set default locale
RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen && \
    locale-gen && \
    echo LANG=en_US.UTF-8 > /etc/default/locale && \
    mkdir /var/run/sshd && \
    mkdir /root/.ssh

COPY authorized_keys /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh && \
    chmod 600 /root/.ssh/authorized_keys

WORKDIR /root

