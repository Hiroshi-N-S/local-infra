#!/bin/bash
set -eux

WORK_DIR=$(pwd)
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
# install nfs csi driver

helm repo add csi-driver-nfs https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/master/charts
helm install \
  csi-driver-nfs \
  csi-driver-nfs/csi-driver-nfs \
  --namespace kube-system \
  --version v4.6.0 \
  -f ${SCRIPT_DIR}/values.yaml

# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
# apply volumesnapshotclass

kubectl apply -f ${SCRIPT_DIR}/csi-nfs-snapshotclass.yaml

# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
# apply storageclass for synology nas

kubectl apply -f ${SCRIPT_DIR}/synology-nfs-storageclass.yaml
