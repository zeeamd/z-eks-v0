# z-eks-v0

# AWS EKS setup

# Karpenter - Node scaling

# Keda - Pod scaling

# Istio - Service Mesh

# Cert management
https://thiagoalves.ai/how-to-add-a-self-signed-ssl-certificate-to-aws-certificate-manager/
https://www.ssldragon.com/blog/check-certificate-openssl-linux/

https://karpenter.sh/v0.37/getting-started/getting-started-with-karpenter/
Warning: flowcontrol.apiserver.k8s.io/v1beta3 FlowSchema is deprecated in v1.29+, unavailable in v1.32+; use flowcontrol.apiserver.k8s.io/v1 FlowSchema
flowschema.flowcontrol.apiserver.k8s.io/karpenter-leader-election created
flowschema.flowcontrol.apiserver.k8s.io/karpenter-workload created

helm install keda . --namespace keda --create-namespace

kubectl get events --sort-by='.lastTimestamp'
# worker node needs sqs read access for scaled object (identityOwnwer: Operator)
Warning   KEDAScalerFailed               scaledobject/aws-sqs-queue-scaledobject-inflate                       (combined from similar events): operation error SQS: GetQueueAttributes, https response error StatusCode: 403, RequestID: 5c03abf7-14e0-5c0d-accc-f4a46ba98c1c, api error AccessDenied: User: arn:aws:sts::637423611293:assumed-role/eksctl-zeks0-nodegroup-zeks0-ng-NodeInstanceRole-v53OjH8KaIXl/i-0adec52695b3c98b6 is not authorized to perform: sqs:getqueueattributes on resource: arn:aws:sqs:us-east-1:637423611293:keda-trigger-test-v0 because no identity-based policy allows the sqs:getqueueattributes action

