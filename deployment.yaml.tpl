---
## Deployment ###

apiVersion: apps/v1
kind: Deployment
metadata:
  name: springapp
  namespace: springapp
  labels:
    app: springapp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: springapp
  template:
    metadata:
      labels:
        app: springapp
    spec:
      containers:
      - name: springapp
        image: gcr.io/optical-carrier-353406/springapp:COMMIT_SHA
        ports:
        - containerPort: 8080
