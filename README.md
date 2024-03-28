# What is Kubernetes☸️ ?
kubernetes is greek word meaning of captain.
Kubernetes, also known as k8s or kube, is an open source container orchestration platform for scheduling and automating the deployment, management and scaling of containerized applications.

# Why Kubernetes?
Kubernetes offers several key advantages that make it a popular choice for container orchestration and management:
- **🧑🏻‍💻Deployment:**
Deploy a specified number of containers to a specified host and keep them running in a wanted state.

- **✏️Rollouts:**
A rollout is a change to a deployment. Kubernetes lets you initiate, pause, resume or roll back rollouts.

- **🌎Service discovery:**
Kubernetes can automatically expose a container to the internet or to other containers by using a domain name system (DNS) name or IP address.

- **🛢️provisioning:**
Set Kubernetes to mount persistent local or cloud storage for your containers as needed.

- **⚖️Load balancing:**
Based on CPU usage or custom metrics, Kubernetes load balancing can distribute the workload across the network to maintain performance and stability. 

- **📈Autoscaling:**
When traffic spikes, Kubernetes autoscaling can spin up new clusters as needed to handle the additional workload.

- **🌐 Self-healing for high availability:**
When a container fails, Kubernetes can restart or replace it automatically to prevent downtime. It can also take down containers that don’t meet your health check requirements.



#📐Architecture of Kubernetes

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20231227123323/Kubernetes-Architecture.png" />

### Componenets of Control Plane
- **🤖API server:** The application programming interface (API) server in Kubernetes exposes the Kubernetes API (the interface used to manage, create and configure Kubernetes clusters) and serves as the entry point for all commands and queries.

- **📅Scheduler:** This component tracks newly created pods and selects nodes for them to run on. The scheduler considers resource availability and allocation restraints, hardware and software requirements, and more. 

- **📊etcd:** The etcd is an open source, distributed key-value store used to hold and manage the critical information that distributed systems need to keep running. In Kubernetes, the etcd manages the configuration data, state data and metadata.

- **🛠️Controller-manager:** A set of built-in controllers, the Kubernetes controller-manager runs a control loop that monitors the shared state of the cluster and communicates with the API server to manage resources, pods or service endpoints. The controller-manager consists of separate processes that are bundled together to reduce complexity and run in one process. 

- **☁️Cloud-controller-manager:** This component is similar in function to the controller-manager link. It links to a cloud provider’s API and separates the components that interact with that cloud platform from those that only interact within the cluster.

### Node components
Worker nodes are responsible for deploying, running and managing containerized applications:

- **🤖Pod**: A pod is a smaller unit in kubernetes it comes metadata on top of containers . A pod can contain one or more containers based on that is will be called as single pod or multipod . Inside the pod containers share the same network namespace , storage , configuration. These are designed to run as a single instance of a process , facilitating easy scaling and management.
- **💻Container Runtime**: Container runtime is a software component responsible for running containers
- **🔀Kubelet**: Kubelet is a software agent that receives and runs orders from the master node and helps to ensure that containers run in a pod. 

- **🖧 Kube-proxy**: Installed on every node in a cluster, the kube-proxy maintains network rules on the host and monitors changes in services and pods. 
