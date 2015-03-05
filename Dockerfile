FROM gliderlabs/alpine:latest

ENV KB_PKG_NAME kibana-4.0.1

RUN \
  apk update && \
  apk add wget && \
  apk add nodejs

RUN mkdir /opt
RUN wget --no-check-certificate https://download.elasticsearch.org/kibana/kibana/$KB_PKG_NAME-linux-x64.tar.gz -O /tmp/kibana.tar.gz
RUN tar zxvf /tmp/kibana.tar.gz -C /opt && mv /opt/$KB_PKG_NAME-linux-x64 /opt/kibana && rm -rf /tmp/kibana.tar.gz

RUN ln -sf /usr/bin/node /opt/kibana/node/bin/node

EXPOSE 5601

CMD ["/opt/kibana/bin/kibana"]
