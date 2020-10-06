# sgx-aesmd

Docker container for the Intel® SGX Application Enclave Services Manager process, The aesmd is part of the Intel Software Guard Extensions software or Intel® Software Guard Extensions Platform from Intel (www.intel.com)
DaemonSet

A DaemonSet ensures that all (or some) Nodes run a copy of a Pod. As nodes are added to the cluster, Pods are added to them. As nodes are removed from the cluster, those Pods are garbage collected. Deleting a DaemonSet will clean up the Pods it created.

In general it is desired to run a dedicated aesmd on each node. To do so run:

```
wget https://raw.githubusercontent.com/MADANA-IO/sgx-aesmd/master/aesmd-daemonset.yaml
kubectl apply -f aesmd-daemonset.yaml
```


