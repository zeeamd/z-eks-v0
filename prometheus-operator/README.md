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
kubectl create secret generic kubepromsecret \
  --from-literal=username=admin\
 --from-literal=password=admin\
 -n po
