#!/usr/bin/env bash

echo "${NFS_HOST}:${NFSMOUNT} ${NFSMOUNT} nfs hard,nolock 0 0" > /etc/fstab

while ( ! mount | grep "on ${NFSMOUNT} type" > /dev/null; ); do
   sleep 5
   mount "${NFSMOUNT}"
done

balena-idle --silent
