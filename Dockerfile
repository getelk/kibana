FROM gliderlabs/alpine:latest

ENV KB_PKG_NAME kibana-3.1.2

RUN mkdir /opt
RUN wget http://s3.amazonaws.com/replicated-cdn/kibana/$KB_PKG_NAME.tar.gz -O /tmp/kibana.tar.gz
RUN tar zxvf /tmp/kibana.tar.gz -C /opt && mv /opt/$KB_PKG_NAME /opt/kibana && rm -rf /tmp/kibana.tar.gz

ADD ./files/config.js /opt/kibana/config.js


RUN \
  apk update && \
  apk add nginx && \
  mkdir -p /tmp/nginx

EXPOSE 80
EXPOSE 443

ADD ./files/nginx.conf /etc/nginx/nginx.conf

RUN echo "hello"

CMD ["nginx"]
