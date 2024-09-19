#
download istio tag gz

#
istioctl install --set profile=default

# choose otel exporter
cat <<EOF | istioctl uninstall -y -f -
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

cat <<EOF | istioctl manifest generate -f - > abc.yml
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

# global istiod options (otel-tracing)
https://istio.io/latest/docs/reference/config/istio.mesh.v1alpha1/

# base
helm install -n istio-system istio-base istio-1.23.0/manifests/charts/base

# istiod - update mesgConfig for otel-tracing
helm install -n istio-system istiod istio-1.23.0/manifests/charts/istio-control/istio-discovery

# ingress
helm install -n istio-ingress istio-ingress istio-1.23.0/manifests/charts/gateways/istio-ingress

# cleanup istio all
istioctl uninstall --purge

# installation methods
https://istio.io/latest/about/faq/#install-method-selection
