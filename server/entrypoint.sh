#!/usr/bin/env bash

echo "${NFSMOUNT} *(fsid=0,rw,sync,no_subtree_check,all_squash,anonuid=65534,anongid=65534)" > /etc/exports

## Load modules
modprobe nfs
modprobe nfsd
modprobe nfsv3

service rpcbind start || true
service nfs-kernel-server start
balena-idle --silent
