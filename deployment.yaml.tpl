---
## Deployment ###

apiVersion: apps/v1
kind: Deployment
metadata:
  name: springapp
  namespace: default
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
        image: asia-docker.pkg.dev/GOOGLE_CLOUD_PROJECT/my-repo/springapp:COMMIT_SHA
        ports:
        - containerPort: 8080

---
### Deploy Service ###

apiVersion: v1
kind: Service
metadata:
  name: springapp-service
  namespace: default
spec:
  selector:
    app: springapp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  type: NodePort
