#
https://github.com/prometheus-operator/prometheus-operator/blob/main/Documentation/user-guides/getting-started.md
#
https://observability.thomasriley.co.uk/prometheus/configuring-prometheus/using-service-monitors/
#
https://grafana.com/docs/grafana-cloud/monitor-infrastructure/kubernetes-monitoring/configuration/config-other-methods/prometheus/remote-write-operator/
#
https://prometheus-operator.dev/docs/developer/getting-started/
#
https://observability.thomasriley.co.uk/prometheus/configuring-prometheus/using-service-monitors/
#
https://grafana.com/docs/grafana-cloud/monitor-infrastructure/kubernetes-monitoring/configuration/config-other-methods/prometheus/remote-write-operator/
#
https://prometheus-prod-13-prod-us-east-0.grafana.net/api/prom/push
#
kubectl create secret generic kubepromsecret \
  --from-literal=username=1829879\
 --from-literal=password=token\
 -n po
#
kubectl run --rm utils -it --image arunvelsriram/utils bash -n po
#
https://github.com/arunvelsriram/utils
