# create a vpc (igw + nat)

#
https://karpenter.sh/v0.37/getting-started/migrating-from-cas/

# allow nodes that are using the node IAM role to join the cluster
kubectl edit configmap aws-auth -n kube-system

# generate karpenter deployment yml from helm
helm template karpenter oci://public.ecr.aws/karpenter/karpenter --version "${KARPENTER_VERSION}" --namespace "${KARPENTER_NAMESPACE}" \
    --set "settings.clusterName=${CLUSTER_NAME}" \
    --set "serviceAccount.annotations.eks\.amazonaws\.com/role-arn=arn:${AWS_PARTITION}:iam::${AWS_ACCOUNT_ID}:role/KarpenterControllerRole-${CLUSTER_NAME}" \
    --set controller.resources.requests.cpu=1 \
    --set controller.resources.requests.memory=1Gi \
    --set controller.resources.limits.cpu=1 \
    --set controller.resources.limits.memory=1Gi > karpenter.yml

# validate oidc
https://repost.aws/knowledge-center/eks-troubleshoot-oidc-and-irsa

# add oidc provider for eks
https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html

# eks autoscaler optional
kubectl scale deploy/cluster-autoscaler -n kube-system --replicas=0

# verify karpenter
kubectl logs -f -n karpenter -c controller -l app.kubernetes.io/name=karpenter
