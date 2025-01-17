# k8-facets
A repo to manage all cluster facets in a separate pipeline. Facets are managed either as helm manifests or k8 manifests.

## Pipelines

This section will brief deployment instructions.

## Facets

| Name  | Version | Manifest type |
| :---         | :---      | :---      |
| [Istio](#istio)  | v1.4.1  | k8 - operator |
| [ArgoCD](#argocd)  | v1.3.2  | helm |
| [KNative](#knative)  | v0.10.0  | k8 - operator |
| [Kubeflow](#kubeflow)  | 1.3.2  | helm |

## Dashboards

| Name  | http credentials | https credentials |
| :---         | :---      | :---      |
| [ArgoCD](http://argocd.robocicd.com)  | admin/argocd  | TBD |
| [Kiali](http://kiali.robocicd.com:15029)  | admin/admin  | TBD |
| [Tracing](http://tracing.robocicd.com:15032)  | N/A  | TBD |
| [Grafana](http://grafana.robocicd.com:15031)  | N/A  | TBD |
| [Prometheus](http://prometheus.robocicd.com:15030)  | N/A  | TBD |

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

[Argo CD](https://argoproj.github.io/argo-cd/) is a declarative, GitOps continuous delivery tool for Kubernetes. We are using helm manifests to manage argoCD deployment in `argo-cd` namespace. Following are `helm3` commands to install the same:

#### Install

```bash
helm install argo-cd argo-cd -n argo-cd
```

#### Uninstall

```bash
helm uninstall argo-cd
```

## KNative

TBD

## Kubeflow

TBD


