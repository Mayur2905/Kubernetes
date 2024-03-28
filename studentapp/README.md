# Student App Deployment
    This repository contains Kubernetes configuration files to deploy a student app consisting of a database, backend, and frontend components.

## Prerequisites
Before deploying the student app, ensure you have the following:

Kubernetes cluster running
kubectl configured to manage the cluster
## Deployment

1. Clone this repository:
```
git clone https://github.com/your-repo/studentapp.git
cd studentapp
```

2. Apply the Pod configuration:
    
```
kubectl apply -f pods.yml
```
3. Apply the Service configuration:

```
kubectl apply -f service.yml

```

# Accessing the Application
Once the deployment is successful, you can access the student app using the NodePort exposed by the service. Use the following command to get the NodePort:

```
kubectl get svc mysrvices

```
You can then access the app using the NodePort assigned to the nginx service.

# Cleaning Up
To clean up the deployment, use the following commands:

```
kubectl delete -f service.yml
kubectl delete -f pods.yml
```