# Kubernetes-Important-Debugging

## Unable to delete Namespace - Due to CRD dependency
kubectl patch crd $CRD -p '{"metadata":{"finalizers": [null]}}' ' --type=merge

## Find the process of a Port
sudo lsof -i -P -n | grep 8879
