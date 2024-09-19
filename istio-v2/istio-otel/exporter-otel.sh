# https://istio.io/latest/docs/tasks/observability/distributed-tracing/opentelemetry/

cat <<EOF | istioctl install -y -f -
apiVersion: install.istio.io/v1alpha1
kind: IstioOperator
spec:
  meshConfig:
    enableTracing: true
    extensionProviders:
    - name: otel-tracing
      opentelemetry:
        port: 4317
        service: opentelemetry-collector.otel.svc.cluster.local
        resource_detectors:
          environment: {}
EOF

# 2024-09-17T07:52:05.901Z        info    exporterhelper/queued_retry.go:215      Exporting failed. Will retry the request after interval.{"kind": "exporter", "data_type": "traces", "name": "zipkin", "error": "failed to push trace data via Zipkin exporter: Post \"http://zipkin.istio-system.svc:9411/api/v2/spans\": dial tcp: lookup zipkin.istio-system.svc on 10.100.0.10:53: no such host", "interval": "5.52330144s"}
# get rid of zipkin from config map
# https://github.com/istio/istio/tree/release-1.23/samples/open-telemetry/tracing
# https://istio.io/latest/docs/tasks/observability/distributed-tracing/opentelemetry/
# https://istio.io/latest/docs/tasks/observability/distributed-tracing/overview/
# https://istio.io/latest/docs/setup/additional-setup/config-profiles/

#cat <<EOF | istioctl manifest generate -f - > abc.yml
#apiVersion: install.istio.io/v1alpha1
#kind: IstioOperator
#spec:
#  meshConfig:
#    enableTracing: true
#    extensionProviders:
#    - name: otel-tracing
#      opentelemetry:
#        port: 4317
#        service: opentelemetry-collector.otel.svc.cluster.local
#        resource_detectors:
#          environment: {}
#EOF
