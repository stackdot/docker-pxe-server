
service openbsd-inetd restart
service tftpd-hpa restart

echo 'Ran startup script'

while true; do sleep 1000; done
