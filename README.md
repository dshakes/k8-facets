# k8-facets
A repo to manage all cluster facets in a separate pipeline. Facets are managed as either a helm manifest or k8 manifest.

## Pipelines

This section will brief deployment instructions.

## Facets

| Name  | Version | Manifest type |
| :---         | :---      | :---      |
| [Istio](#istio)  | v1.4.1  | k8 - operator |
| [ArgoCD](#argocd)  | v1.3.2  | helm |
| [KNative](#knative)  | v0.10.0  | k8 - operator |
| [Kubeflow](#kubeflow)  | 1.3.2  | helm |

## Istio

We use istio operator to install and manage istio components across clusters. Istio [operator](https://istio.io/blog/2019/introducing-istio-operator/) is in `alpha` state but soon they are depracating istio management via helm.

We will be using `demo` profile for managing configuration profiles.

Istio Version: 1.4.1

#### Install

Istio control plane requires `Istio Operator` to be installed as pre-requisite in `istio-operator` namespace.

```bash
kubectl apply -f operator.yaml
```

They recommend `istioctl` to manage manifests. Following commands installs all istio components in `istio-system` namespace.

```bash
brew install istioctl
```

```bash
istioctl manifest apply -f gdjmt-control-plane.yaml
```

#### Uninstall

```bash
kubectl -n istio-operator get IstioControlPlane gdjmt-profile -o=json | jq '.metadata.finalizers = null' | kubectl delete -f -
kubectl delete ns istio-operator --grace-period=0 --force
kubectl delete ns istio-system --grace-period=0 --force

```

## ArgoCD

TBD

## KNative

TBD

## Kubeflow

TBD

