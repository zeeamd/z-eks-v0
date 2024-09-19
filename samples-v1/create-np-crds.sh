#kubectl create namespace "${KARPENTER_NAMESPACE}"

kubectl create -f \
    "https://raw.githubusercontent.com/aws/karpenter-provider-aws/v${KARPENTER_VERSION}/pkg/apis/crds/karpenter.sh_nodepools.yaml"
kubectl create -f \
    "https://raw.githubusercontent.com/aws/karpenter-provider-aws/v${KARPENTER_VERSION}/pkg/apis/crds/karpenter.k8s.aws_ec2nodeclasses.yaml"
kubectl create -f \
    "https://raw.githubusercontent.com/aws/karpenter-provider-aws/v${KARPENTER_VERSION}/pkg/apis/crds/karpenter.sh_nodeclaims.yaml"

#kubectl apply -f karpenter.yaml

# This creates NodePool CRDs in the cluster (NodePools, EC2NodeClasses, NodeClaims)

# create ns
# create nodepool crds
# then deploy karpenter resources

#kubectl create -f sh_nodepools.yml
#kubectl create -f aws_ec2nodeclasses.yml
#kubectl create -f sh_nodeclaims.yml
