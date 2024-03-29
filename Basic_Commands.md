## Basic Commands of K8

1. `kubectl get apiservices` : List the API Servers
2. `kubectl run pod --image=nginx` : Create a pod of nginx
3. `kubectl get pods` : list pods running in namespace
4. `kubectl describe pod_name` : Describe the pods
5. `kubectl get -o wide pod_name` : list pods in detailes
6. `kubectl logs pod_name` : list out the logs of pods
7. `kubectl delete pod <pod_name>`: Delete the running pod
8. `kubectl cluster-info` : gives the information about the cluster
9. `kubectl get nodes`: list out the nodes
10. `kubectl expose pod <pod-name> --type=ClusterIP --port=<port> --target-port=<target-port>`: expose a pod on a specific target port
11. `kubectl expose pod <pod-name> --type=NodePort --port=<port> --target-port=<target-port>`: expose a pod on a specific target port using a ClusterIP
12. `kubectl expose pod <pod-name> --type=LoadBalancer --port=<port> --target-port=<target-port>`: Create a LoadBalancer type service in Kubernetes
13. `kubectl exec -it <pod-name> -c <container-name> -- bash`
14. `kubectl cp <file-spec-src> <file-spec-dest>` :eg. kubectl cp file.txt default/my-pod:/path/to/file.txt
15. `kubectl apply -f <filename>`: Apply a configuration file to create or update a resource.
16. `kubectl get deployments`: List all deployments in the current namespace.
17. `kubectl get services`: List all services in the current namespace.
18. `kubectl get namespaces`: List all namespaces in the cluster.
19. `kubectl scale deployment <deployment-name> --replicas=<replica-count>`: Scale a deployment to the specified number of replicas.
20. `kubectl rollout status deployment/<deployment-name> `:Check the status of a rollout for a deployment.
21. `kubectl rollout history deployment/<deployment-name>`: View the rollout history for a deployment.
22. `kubectl rollout undo deployment/<deployment-name>`: Undo the last rollout for a deployment.
23. `kubectl delete deployment <deployment-name>`: Delete a deployment.
24. `kubectl delete service <service-name>`: Delete a service.

