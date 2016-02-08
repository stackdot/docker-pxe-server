# Docker PXE Boot Server

This is a docker container that is used to host PXE service for your host machines to boot from.

You must mount your pxeconfig folder for it to work. Also, nginx is installed and running by default on port 8888 for hosting your cloud-config files.

### To run:

	docker run -d --privileged=true --net=host --restart=always -v /tftfiles/:/var/lib/tftpboot/ -v /nginx-files/:/usr/share/nginx/html/ stackdot/docker-pxe-server:latest

Must be run as privileged and with net=host. This is due to the PXE service.

#### Just an FYI:
- PXE runs on port 69
- HTTP server runs on port 8888