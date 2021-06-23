apiVersion: apps/v1
kind: Deployment
metadata:
  name: golang-wiki
  namespace: cloud-platform-reference-app
spec:
  selector:
    matchLabels:
      app: golang-wiki
  replicas: 3
  template:
    metadata:
      labels:
        app: golang-wiki
    spec:
      containers:
      - name: golang-wiki
        image: ${ECR_URL}:${IMAGE_TAG}
        ports:
        - containerPort: 8082
