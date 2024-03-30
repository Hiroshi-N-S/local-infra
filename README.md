# local-infra

This repository contains configuration files for setting up a local environment for DevOps related development.

- [local-infra](#local-infra)
  - [Setup](#setup)
  - [References](#references)

## Setup

``` sh
git clone https://github.com/Hiroshi-N-S/local-infra.git

sh kind/create-kind-cluster.sh
```

## References

- [kubernetes](https://kubernetes.io/)
  - [kind](https://kind.sigs.k8s.io/)
  - [csi-driver-nfs](https://github.com/kubernetes-csi/csi-driver-nfs)
    - [Helm chart](https://github.com/kubernetes-csi/csi-driver-nfs/tree/master/charts)
- [Helm](https://helm.sh/docs/)
- [Argo CD](https://argoproj.github.io/cd/)
  - [Helm chart](https://artifacthub.io/packages/helm/argo/argo-cd)
  - [using-a-private-registry](https://kubernetes.io/docs/concepts/containers/images/#using-a-private-registry)
  - [repositories](https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/#repositories)
