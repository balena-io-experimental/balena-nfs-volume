#!/usr/bin/env bash

echo "${NFSMOUNT} *(rw,sync,no_subtree_check,no_root_squash,no_all_squash)" > /etc/exports

## Load modules
modprobe nfs
modprobe nfsd
modprobe nfsv3

service rpcbind start || true
service nfs-kernel-server start
balena-idle --silent
