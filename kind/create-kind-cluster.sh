#!/bin/bash
set -eux

WORK_DIR=$(pwd)
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
# create a kind cluster

cd ${SCRIPT_DIR}
kind create cluster --config config/kind-cluster.yaml

sleep 10 &
wait

# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
# apply resources

sh resources/csi-driver-nfs/apply.sh
sh resources/ingress-nginx/apply.sh
sh resources/argo-cd/apply.sh
