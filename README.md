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

### Componenets of Control Plane
- **API server:** The application programming interface (API) server in Kubernetes exposes the Kubernetes API (the interface used to manage, create and configure Kubernetes clusters) and serves as the entry point for all commands and queries.

- **Scheduler:** This component tracks newly created pods and selects nodes for them to run on. The scheduler considers resource availability and allocation restraints, hardware and software requirements, and more. 

- **etcd:** The etcd is an open source, distributed key-value store used to hold and manage the critical information that distributed systems need to keep running. In Kubernetes, the etcd manages the configuration data, state data and metadata.

- **Controller-manager:** A set of built-in controllers, the Kubernetes controller-manager runs a control loop that monitors the shared state of the cluster and communicates with the API server to manage resources, pods or service endpoints. The controller-manager consists of separate processes that are bundled together to reduce complexity and run in one process. 

- **Cloud-controller-manager:** This component is similar in function to the controller-manager link. It links to a cloud provider’s API and separates the components that interact with that cloud platform from those that only interact within the cluster.

### Node components
Worker nodes are responsible for deploying, running and managing containerized applications:

- **Pod**: A pod is a smaller unit in kubernetes it comes metadata on top of containers . A pod can contain one or more containers based on that is will be called as single pod or multipod . Inside the pod containers share the same network namespace , storage , configuration. These are designed to run as a single instance of a process , facilitating easy scaling and management.
- **Container Runtime**: Container runtime is a software component responsible for running containers
- **Kubelet**: Kubelet is a software agent that receives and runs orders from the master node and helps to ensure that containers run in a pod. 

- **Kube-proxy**: Installed on every node in a cluster, the kube-proxy maintains network rules on the host and monitors changes in services and pods. 
