### What is k3d

[[k3d]] is a lightweight wrapper to run [[k3s]] (Rancher Lab’s minimal [[Kubernetes]] distribution) in docker.

[[k3d]] makes it very easy to create single- and multi-node [[k3s]] clusters in docker, e.g. for local development on [[Kubernetes]].

### What is [[Argo CD]]  

[https://argo-cd.readthedocs.io/en/stable/getting_started/](https://argo-cd.readthedocs.io/en/stable/getting_started/)

## Walkthrough

https://dev.to/danielcristho/k3d-getting-started-with-argocd-5c6l
https://gitlab.com/BeBel42/inception-of-things/-/tree/master/p3?ref_type=heads
##### What do we have to put on the public repo ?
idk yet

#### Create a cluster
```sh
sudo k3d cluster create $CLUSTER_NAME --api-port 6443 -p 8080:80@loadbalancer --agents 2
```

#### Install [[Argo CD]]
```sh
sudo kubectl create namespace argocd
sudo kubectl create namespace dev
curl -OL https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

##### Create config file
https://argo-cd.readthedocs.io/en/stable/operator-manual/declarative-setup/

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: guestbook
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/argoproj/argocd-example-apps.git
    targetRevision: HEAD
    path: guestbook
  destination:
    server: https://kubernetes.default.svc
    namespace: guestbook
```

After launching the dependency script.
launch `sudo kubectl apply -f application.yaml`
`sudo kubectl port-forward service/argocd-server -n argocd 8080:443`
`sudo kubectl port-forward service/wil-playground -n dev 8888:8888`
