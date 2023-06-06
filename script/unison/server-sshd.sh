#!/bin/sh

# This script is used to start or stop the sshd server
OPTIONS="start|stop|restart|status"

if [ $# -ne 1 ]; then
    echo "Usage: $0 $OPTIONS"
    exit 1
fi

case "$1" in
    start)
        echo "Starting sshd server..."
        systemctl start sshd.service
        ;;
    stop)
        echo "Stopping sshd server..."
        systemctl stop sshd.service
        ;;
    restart)
        echo "Restarting sshd server..."
        systemctl restart sshd.service
        ;;
    status)
        echo "Checking sshd server status..."
        systemctl status sshd.service
        ;;
    *)
        echo "Usage: $0 $OPTIONS"
        exit 1
        ;;
esac