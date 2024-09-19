# If your setup uses the security groups in the Launch template of a managed node group, then

NODEGROUP=$(aws eks list-nodegroups --cluster-name "${CLUSTER_NAME}" \
    --query 'nodegroups[0]' --output text)

LAUNCH_TEMPLATE=$(aws eks describe-nodegroup --cluster-name "${CLUSTER_NAME}" \
    --nodegroup-name "${NODEGROUP}" --query 'nodegroup.launchTemplate.{id:id,version:version}' \
    --output text | tr -s "\t" ",")

SECURITY_GROUPS="$(aws ec2 describe-launch-template-versions \
    --launch-template-id "${LAUNCH_TEMPLATE%,*}" --versions "${LAUNCH_TEMPLATE#*,}" \
    --query 'LaunchTemplateVersions[0].LaunchTemplateData.[NetworkInterfaces[0].Groups||SecurityGroupIds]' \
    --output text)"

echo $SECURITY_GROUPS

aws ec2 create-tags \
    --tags "Key=karpenter.sh/discovery,Value=${CLUSTER_NAME}" \
    --resources ${SECURITY_GROUPS}

#aws ec2 create-tags \
#    --tags "Key=karpenter.sh/discovery,Value=${CLUSTER_NAME}" \
#    --resources "sg-0c159d5df50191c0b"

#aws ec2 create-tags \
#    --tags "Key=karpenter.sh/discovery,Value=${CLUSTER_NAME}" \
#    --resources "sg-0133bc9a323ad03ad"

# This sg will be used by karpenter scaled nodes
