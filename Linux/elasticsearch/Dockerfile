FROM elasticsearch:5.6.14-alpine

EXPOSE 9200 9300

# Build args.
ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

# Labels.
LABEL maintainer "jearzamendia@gmail.com" description "Joao E. Arzamendia"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="jarzamendia/elasticsearch"
LABEL org.label-schema.description="Elasticsearch Server"
LABEL org.label-schema.url="https://www.elastic.co/"
LABEL org.label-schema.vcs-url="https://github.com/jarzamendia/elasticsearch"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="elastic.co"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run -v ~/elasticsearch/data:/usr/share/elasticsearch/data -p 9200:9200 -d jarzamendia/elasticsearch"