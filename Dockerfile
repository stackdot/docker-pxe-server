FROM ubuntu:14.04

# Use root user
USER root
ENV DEBIAN_FRONTEND=noninteractive

# File Author / Maintainer
MAINTAINER Quinton Pike

# Install packages:
RUN apt-get install openbsd-inetd lftp tftpd-hpa syslinux -y

# Set the config file:
COPY _etc_inetd.conf /etc/inetd.conf
COPY startup.sh /startup.sh

WORKDIR /

RUN chmod +x /startup.sh

# Enable inetd:
RUN update-inetd --enable BOOT

VOLUME ["/var/lib/tftpboot/"]

CMD ["/bin/bash", "/startup.sh"]
