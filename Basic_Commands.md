## Basic Commands of K8

`kubectl get apiservices` : List the API Servers

`kubectl run pod --image=nginx` : Create a pod of nginx
`kubectl get pods` : list pods running in namespace
`kubectl describe pod_name` : Describe the pods
`kubectl get -o wide pod_name` : list pods in detailes
`kubectl logs pod_name` : list out the logs of pods
`kubectl delete pod <pod_name>`: Delete the running pod
`kubectl cluster-info` : gives the information about the cluster
`kubectl get nodes`: list out the nodes

`kubectl expose pod <pod-name> --type=ClusterIP --port=<port> --target-port=<target-port>`: expose a pod on a specific target port 

`kubectl expose pod <pod-name> --type=NodePort --port=<port> --target-port=<target-port>`: expose a pod on a specific target port using a ClusterIP


`kubectl expose pod <pod-name> --type=LoadBalancer --port=<port> --target-port=<target-port>`: Create a LoadBalancer type service in Kubernetes

`kubectl exec -it <pod-name> -c <container-name> -- bash`

`kubectl cp <file-spec-src> <file-spec-dest>` :eg. kubectl cp file.txt default/my-pod:/path/to/file.txt

`kubectl apply -f <filename>`: Apply a configuration file to create or update a resource.

`kubectl get deployments`: List all deployments in the current namespace.

`kubectl get services`: List all services in the current namespace.

`kubectl get namespaces`: List all namespaces in the cluster.

`kubectl scale deployment <deployment-name> --replicas=<replica-count>`: Scale a deployment to the specified number of replicas.

`kubectl rollout status deployment/<deployment-name> `:Check the status of a rollout for a deployment.

`kubectl rollout history deployment/<deployment-name>`: View the rollout history for a deployment.

`kubectl rollout undo deployment/<deployment-name>`: Undo the last rollout for a deployment.

`kubectl delete deployment <deployment-name>`: Delete a deployment.

`kubectl delete service <service-name>`: Delete a service.

