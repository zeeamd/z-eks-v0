docker run -d --name jaeger \
  -e COLLECTOR_ZIPKIN_HOST_PORT=:9411 \
  -p 5775:5775/udp \
  -p 6831:6831/udp \
  -p 6832:6832/udp \
  -p 5778:5778 \
  -p 16686:16686 \
  -p 14268:14268 \
  -p 14250:14250 \
  -p 9411:9411 \
  jaegertracing/all-in-one:1.23

# https://medium.com/aspecto/why-and-how-to-run-jaeger-locally-6b8fac37e8fd

# docker ps
# CONTAINER ID   IMAGE                           COMMAND                  CREATED        STATUS        PORTS                                                                                                                                                                                                                                                                                                                                         NAMES
# fda72a8fcc98   jaegertracing/all-in-one:1.23   "/go/bin/all-in-one-…"   11 hours ago   Up 11 hours   0.0.0.0:5775->5775/udp, :::5775->5775/udp, 0.0.0.0:5778->5778/tcp, :::5778->5778/tcp, 0.0.0.0:9411->9411/tcp, :::9411->9411/tcp, 0.0.0.0:14250->14250/tcp, :::14250->14250/tcp, 0.0.0.0:14268->14268/tcp, :::14268->14268/tcp, 0.0.0.0:6831-6832->6831-6832/udp, :::6831-6832->6831-6832/udp, 0.0.0.0:16686->16686/tcp, :::16686->16686/tcp   jaeger
