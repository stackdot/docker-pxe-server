FROM ubuntu:14.04

# Use root user
USER root
ENV DEBIAN_FRONTEND=noninteractive

# File Author / Maintainer
MAINTAINER Quinton Pike

# Install packages:
RUN apt-get install openbsd-inetd lftp tftpd-hpa syslinux nginx -y

# Set the config file:
COPY _etc_inetd.conf /etc/inetd.conf
COPY startup.sh /startup.sh
COPY nginx-site.conf /etc/nginx/sites-enabled/default
COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /

RUN chmod +x /startup.sh

# Enable inetd:
RUN update-inetd --enable BOOT

# Make Nginx go to stdout / stderr for docker logs:
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/lib/tftpboot/", "/usr/share/nginx/html/"]

CMD ["/bin/bash", "/startup.sh"]