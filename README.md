# Kubernetes-Important-Debugging

## Unable to delete Namespace - Due to CRD dependency
kubectl patch crd $CRD -p '{"metadata":{"finalizers": [null]}}' 
