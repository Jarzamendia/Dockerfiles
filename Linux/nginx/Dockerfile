FROM nginx:1.14.2-alpine

COPY ntpd.conf /etc/ntpd.conf

RUN apk update \
    && apk upgrade \
    && apk add --no-cache openssl \
    && apk add --no-cache ca-certificates \
    && apk add --no-cache tzdata \
    && apk add --no-cache bash \
    && adduser -D -H -u 1000 -s /bin/bash www-data

RUN echo "export LANG=pt_BR.UTF-8" > /etc/profile.d/locale.sh && \
    cp /usr/share/zoneinfo/America/Campo_Grande /etc/localtime && \
    echo "America/Campo_Grande" >  /etc/timezone && \
    apk del tzdata && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

COPY nginx.conf /etc/nginx/

ADD ./startup.sh /opt/startup.sh

RUN sed -i 's/\r//g' /opt/startup.sh

VOLUME /etc/nginx/ssl

CMD ["/bin/sh", "/opt/startup.sh"]

EXPOSE 80 443

# Build args.
ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

# Labels.
LABEL maintainer "jearzamendia@gmail.com" description "Joao E. Arzamendia"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="jarzamendia/nginx"
LABEL org.label-schema.description="Nginx Server"
LABEL org.label-schema.url="https://www.nginx.com//"
LABEL org.label-schema.vcs-url="https://github.com/jarzamendia/nginx"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="NGINX Inc"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run --name some-nginx -v /some/content:/usr/share/nginx/html -d jarzamendia/nginx:tag"