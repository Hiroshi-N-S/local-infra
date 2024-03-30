#!/bin/bash
set -eux

WORK_DIR=$(pwd)
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
# apply argo-cd.
helm repo add argo https://argoproj.github.io/argo-helm
helm install \
  argo-cd \
  argo/argo-cd \
  --create-namespace --namespace argo-cd \
  --version 6.5.1 \
  -f ${SCRIPT_DIR}/values.yaml

sleep 10 &
wait
kubectl wait --namespace argo-cd \
  --for=condition=ready \
  --all pods \
  --timeout=300s
