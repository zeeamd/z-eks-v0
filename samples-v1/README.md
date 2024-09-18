# create a vpc (igw + nat)

#
https://karpenter.sh/v0.37/getting-started/migrating-from-cas/

# allow nodes that are using the node IAM role to join the cluster
kubectl edit configmap aws-auth -n kube-system
