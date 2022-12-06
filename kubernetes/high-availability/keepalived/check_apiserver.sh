#!/bin/sh

K8S_API=k8s-api.beruanglaut.cloud
K8S_VIP=10.15.0.10

errorExit() {
    echo "*** $*" 1>&2
    exit 1
}

curl --silent --max-time 2 --insecure https://localhost:6443/ -o /dev/null || errorExit "Error GET https://localhost:6443/"
if ip addr | grep -q $K8S_VIP; then
    curl --silent --max-time 2 --insecure https://$K8S_API:6443/ -o /dev/null || errorExit "Error GET https://$K8S_API:6443/"
fi
