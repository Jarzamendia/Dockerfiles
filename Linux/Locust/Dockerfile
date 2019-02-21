FROM python:3.6.6-alpine3.8

ENV HTTP_PROXY http://proxy.sgi.ms.gov.br:8081
ENV HTTPS_PROXY http://proxy.sgi.ms.gov.br:8081

RUN apk --no-cache add g++ linux-headers \ 
      && pip install locustio pyzmq

EXPOSE 8089 5557 5558

ADD locustfile.py locustfile.py

ENTRYPOINT ["/usr/local/bin/locust"]