# get rid of zipkin from config map if not needed
# 
https://github.com/istio/istio/tree/release-1.23/samples/open-telemetry/tracing
# 
https://istio.io/latest/docs/tasks/observability/distributed-tracing/opentelemetry/
# 
https://istio.io/latest/docs/tasks/observability/distributed-tracing/overview/
# 
https://istio.io/latest/docs/setup/additional-setup/config-profiles/
#
kubectl label namespace default istio-injection=enabled
#
otlp:
    endpoint: otelcol2:4317
    tls:
      cert_file: cert.pem
      key_file: cert-key.pem
#
exporters:
  otlp/auth:
    endpoint: remote-collector:4317
    auth:
      authenticator: oauth2client
#
https://opentelemetry.io/docs/collector/configuration/
#
https://opentelemetry.io/docs/specs/otel/protocol/exporter/
#
kubectl apply -f cm-observability.yml
#
kubectl rollout restart deployment/opentelemetry-collector -n observabilit
#
Ingest OpenTelemetry Traces to Dynatrace etc.
