# Student App Deployment
This repository contains Kubernetes configuration files to deploy a student app consisting of a database, backend, and frontend components.

## Prerequisites
Before deploying the student app, ensure you have the following:

- Amazon EKS cluster configured
- Node group initialized in the Amazon EKS cluster
- ```kubectl``` configured to manage the cluster
## Deployment

1. Clone this repository:
```
git clone https://github.com/Mayur2905/Kubernetes.git
cd Kubernetes/studentapp
```

2. Apply the Pod configuration:
    
```
kubectl apply -f pods.yml
```
3. Apply the Service configuration:

```
kubectl apply -f service.yml

```
# Copying Files to Pods
To copy files to specific pods, you can use the kubectl cp command. Here are some examples:
- ***Open the index.html and context.xml file and change the ips and ports in it***.
- Copy ```index.html``` to the frontend container in the studentpod pod:
```
kubectl cp index.html studentpod:/var/www/html/index.html -c frontend
```
- Copy ``context.xml`` to the backend container in the studentpod pod:

```
kubectl cp context.xml studentpod:/conf/context.xml -c backend

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