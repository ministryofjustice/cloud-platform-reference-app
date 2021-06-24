apiVersion: apps/v1
kind: Deployment
metadata:
  name: golang-wiki
  namespace: ${KUBE_NAMESPACE}
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

---

apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: golang-wiki
  namespace: ${KUBE_NAMESPACE}
spec:
  tls:
  - hosts:
    - cp-reference.apps.live-1.cloud-platform.service.justice.gov.uk
  rules:
  - host: cp-reference.apps.live-1.cloud-platform.service.justice.gov.uk
    http:
      paths:
      - path: /
        backend:
          serviceName: golang-wiki
          servicePort: 8082

---

apiVersion: v1
kind: Service
metadata:
  name: golang-wiki
  namespace: ${KUBE_NAMESPACE}
  labels:
    app: golang-wiki
spec:
  ports:
  - port: 4000
    name: http
    targetPort: 8082
  selector:
    app: golang-wiki

