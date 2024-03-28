# What is Kubernetes☸️ ?
kubernetes is greek word meaning of captain.
In the context of technology, Kubernetes serves as a "container orchestrator🏗️," steering and managing the deployment, scaling, and operation of containerized applications.

# Why Kubernetes?
# Features of Kubernetes
### - Service discovery and load balancing
Kubernetes can expose a container using the DNS name or using their own IP address. If traffic to a container is high, Kubernetes is able to load balance and distribute the network traffic so that the deployment is stable.
### - Scaling
Auto-scaling: Automatically change the number of running containers, based on CPU utilisation or other application-provided metrics.
### - Self-healing
Kubernetes restarts containers that fail, replaces containers, kills containers that don’t respond to your user-defined health check, and doesn’t advertise them to clients until they are ready to serve.
### - Storage orchestration
Kubernetes allows you to automatically mount a storage system of your choice, such as local storages, public cloud providers, and more.
### - Automated rollouts and rollbacks
You can describe the desired state for your deployed containers using Kubernetes, and it can change the actual state to the desired state at a controlled rate. For example, you can automate Kubernetes to create new containers for your deployment, remove existing containers and adopt all their resources to the new container.
### - Automatic bin packing
You provide Kubernetes with a cluster of nodes that it can use to run containerized tasks. You tell Kubernetes how much CPU and memory each container needs. Kubernetes can fit containers onto your nodes to make the best use of your resources.
### - Secret and configuration management
Kubernetes lets you store and manage sensitive information, such as passwords, OAuth tokens, and SSH keys. You can deploy and update secrets and application configuration without rebuilding your container images, and without exposing secrets in your stack configuration.
Assures high availability with zero downtime
Reliable infrastructure to support data recovery with ease
# Architecture of Kubernetes
<img src="https://media.geeksforgeeks.org/wp-content/uploads/20231227123323/Kubernetes-Architecture.png" />