
# Getting started on the MoJ Cloud Platform: Demo Application
This repository will contain the required files to follow along with the MoJ Digital [Getting Started Guide](Getting%20started%20guide:%20https://ministryofjustice.github.io/cloud-platform-user-docs/cloud-platform/env-create/#creating-a-cloud-platform-environment), the intended outcome of this document is to allow you to run a basic Django web application on the MoJ Cloud Platform.

When discussing the MoJ Cloud Platform in this context, we're referring to a Kops deployed Kubernetes cluster hosted on AWS.

Getting started guide: https://ministryofjustice.github.io/cloud-platform-user-docs/cloud-platform/env-create/#creating-a-cloud-platform-environment

The cluster you'll be using for this exercise is the cloud-platform-non-prod cluster.

## Installing with kubectl
There are many ways to deploying applications to the MoJ Cloud Platform, the below will show the simplist; kubectl.

### Prerequisites
**• Install kubectl**
```brew install kubectl```

**• Create namespace**
Follow the instructions here to create a namespace on the cloud-platform-non-prod cluster: https://ministryofjustice.github.io/cloud-platform-user-docs/cloud-platform/env-create/#creating-a-cloud-platform-environment

### TL;DR
```
# Clone repo
$ git clone git@github.com:ministryofjustice/cloud-platform-reference-app.git
$ cd cloud-platform-reference-app

# Apply Manifests
$ kubectl apply --namespace=<namespace> -f kubectl_deploy/.

# Ensure app is running
$ kubectl get pods -n <namespace>

# Grab URL and test in browser of your choice
$ kubectl get ingress -n <namespace>

# Delete app when done
$ kubectl delete --namespace=<namespace> -f kubectl_deploy/.
$ kubectl get pods -n <namespace> # you should have nothing running
```
To do;

 - [ ] Add full instructions on how to deploy app.
 - [ ] Add postgres manifest
 - [ ] Add Helm Chart for Django app + postgres
 - [ ] Document postgres deployment and helm chart addition
