# Commands to re deploy helm. 

# NOTE - Sometimes helm commands does not work even though the helm server (Tiller) is installed. Below commands removes the tiller and re deploys tiller pods

# Remove the existing deployment of tiller

kubectl get all --all-namespaces | grep tiller
kubectl delete deployment tiller-deploy -n kube-system
kubectl delete service tiller-deploy -n kube-system
kubectl get all --all-namespaces | grep tiller

# Initialize it again

helm init

# Now add the service account

kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'

