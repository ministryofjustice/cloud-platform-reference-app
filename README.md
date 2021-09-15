# Getting started on the MoJ Cloud Platform using CircleCI

Continuous Deployment of an application using [CircleCI](https://user-guide.cloud-platform.service.justice.gov.uk/documentation/deploying-an-app/using-circleci-for-continuous-deployment.html#continuous-deployment-of-an-application-using-circleci-and-helm)
### Prerequisites

* A cloud platform [namespace](https://user-guide.cloud-platform.service.justice.gov.uk/documentation/getting-started/env-create.html#creating-a-cloud-platform-environment)
* An [ECR](https://user-guide.cloud-platform.service.justice.gov.uk/documentation/getting-started/ecr-setup.html#creating-an-ecr-repository) in your namespace, to store your docker images
* A [serviceaccount](https://user-guide.cloud-platform.service.justice.gov.uk/documentation/getting-started/cloud-platform-cli.html#add-a-service-account-to-your-namespace) in your namespace

## Building, tagging and pushing to ECR

1) Build your Docker image using the following command.

```docker build -t cloud-platform/github-action-reference-app .```

2) After the build completes, tag your image so you can push the image to this repository:

```docker tag cloud-platform/github-action-reference-app:latest 754256621582.dkr.ecr.eu-west-2.amazonaws.com/cloud-platform/github-action-reference-app:latest```

3) Run the following command to push this image to your newly created AWS repository:

```docker push 754256621582.dkr.ecr.eu-west-2.amazonaws.com/cloud-platform/github-action-reference-app:latest```

## Authenticate and deploy applications

### Authenticate using service account

The serviceaccount has permissions to deploy to your namespace, so we will use its ca.crt and token in the pipeline. Guidence on Using your serviceaccount to authenticate to the cluster [here](https://user-guide.cloud-platform.service.justice.gov.uk/documentation/deploying-an-app/github-actions-continuous-deployment.html#using-your-serviceaccount)

### CircleCI build/push/deploy

Following every commit to the Main branch a job kicks off, which builds the Dockerfile on root, tags/pushes to ECR and deploys the reference application on the Cloud Platform.

The configuration for this job is in the directory `.circleci/config`.

A set of env vars must be defined for Circle to access the ECR and K8s cluster.
ECR credentials are obtained following [using the Terraform module](https://github.com/ministryofjustice/cloud-platform-terraform-ecr-credentials)

A Kubernetes token and certificate need to be copied from the CircleCI serviceaccount within your Namespace. Click [HERE](https://user-guide.cloud-platform.service.justice.gov.uk/documentation/deploying-an-app/using-circleci-for-continuous-deployment.html#retrieving-the-service-account-credentials) for instructions on how to retrieve these credentials using the [cloud-platform-cli](https://github.com/ministryofjustice/cloud-platform-cli)

You can also run the following using kubectl:
```
kubectl --context ${CLUSTER_NAME_LIVE} -n ${NAMESPACE} get secret circleci-token -o json | jq -r '(.data.token | @base64d), .data."ca.crt"'
```
