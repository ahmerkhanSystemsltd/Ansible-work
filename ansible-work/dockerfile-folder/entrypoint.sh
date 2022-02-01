#!/bin/bash
if [[ ! -f /var/log/auth.log ]]
then
        touch /var/log/auth.log
fi

#starting the SSH service
service ssh start

# link auth.log to container lgo
tail -f /var/log/auth.log
