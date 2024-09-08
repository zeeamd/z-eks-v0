# z-eks-v0

# AWS EKS setup

# Karpenter - Node scaling

# Keda - Pod scaling

# Istio - Service Mesh

# Cert management
https://thiagoalves.ai/how-to-add-a-self-signed-ssl-certificate-to-aws-certificate-manager/
#
https://www.ssldragon.com/blog/check-certificate-openssl-linux/

https://karpenter.sh/v0.37/getting-started/getting-started-with-karpenter/
#
Warning: flowcontrol.apiserver.k8s.io/v1beta3 FlowSchema is deprecated in v1.29+, unavailable in v1.32+; use flowcontrol.apiserver.k8s.io/v1 FlowSchema
flowschema.flowcontrol.apiserver.k8s.io/karpenter-leader-election created
flowschema.flowcontrol.apiserver.k8s.io/karpenter-workload created

helm install keda . --namespace keda --create-namespace

kubectl get events --sort-by='.lastTimestamp'
# worker node needs sqs read access for scaled object (identityOwnwer: Operator)
Warning   KEDAScalerFailed               scaledobject/aws-sqs-queue-scaledobject-inflate                       (combined from similar events): operation error SQS: GetQueueAttributes, https response error StatusCode: 403, RequestID: 5c03abf7-14e0-5c0d-accc-f4a46ba98c1c, api error AccessDenied: User: arn:aws:sts::637423611293:assumed-role/eksctl-zeks0-nodegroup-zeks0-ng-NodeInstanceRole-v53OjH8KaIXl/i-0adec52695b3c98b6 is not authorized to perform: sqs:getqueueattributes on resource: arn:aws:sqs:us-east-1:637423611293:keda-trigger-test-v0 because no identity-based policy allows the sqs:getqueueattributes action

# create ns and setup istioctl
# install base
helm install -n istio-system istio-base istio-1.23.0/manifests/charts/base
#
helm status istio-base -n istio-system
#
helm get all istio-base -n istio-system

# innstall istiod
helm install -n istio-system istiod istio-1.23.0/manifests/charts/istio-control/istio-discovery
#
helm status istiod -n istio-system
#
helm get all istiod -n istio-system

Next steps:
  * Deploy a Gateway: https://istio.io/latest/docs/setup/additional-setup/gateway/
  * Try out our tasks to get started on common configurations:
    * https://istio.io/latest/docs/tasks/traffic-management
    * https://istio.io/latest/docs/tasks/security/
    * https://istio.io/latest/docs/tasks/policy-enforcement/
  * Review the list of actively supported releases, CVE publications and our hardening guide:
    * https://istio.io/latest/docs/releases/supported-releases/
    * https://istio.io/latest/news/security/
    * https://istio.io/latest/docs/ops/best-practices/security/

# install ingress
helm install -n istio-system istio-ingress istio-1.23.0/manifests/charts/gateways/istio-ingress
#
helm uninstall -n istio-system istio-ingress
#
https://github.com/istio/istio/releases
#
https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.2/guide/service/annotations/

# list istio components
helm list -aq -n istio-system

# enable ns for istio
kubectl label namespace default istio-injection=enabled

# enable telemetry for logs
# view logs
kubectl logs -l app=sleep -c istio-proxy
#
kubectl logs istio-ingressgateway-5f766c695f-x2tph -c istio-proxy -n istio-system

# secrets
kubectl create -n istio-system secret tls httpbin-tls-secret \
  --key=private.key \
  --cert=certificate.crt

# check cert
curl -v -H "Host: ctv0.in" https://a97cae6e285984974b88f467e21d1cdd-fe350cbc56846c88.elb.us-east-1.amazonaws.com/headers
# print status
kubectl exec s-nginx-deployment-6d9bfc7997-b4rzp -c snginx-container -- curl -I http://d-tomcat-service.default.svc.cluster.local:8080

# kubectl cmds samples
kubectl attach curl-deployment-7b8f7879bc-knmq8 -c curl-container -i -t
#
kubectl exec curl-deployment-7b8f7879bc-knmq8 -c curl-container -- curl https://8.8.8.8
#
kubectl exec s-nginx-deployment-6d9bfc7997-b4rzp -c snginx-container -- curl http://d-tomcat-service.default.svc.cluster.local:8080
#
kubectl logs d-tomcat-deployment-78879cdd6d-dk5ws -c istio-proxy
