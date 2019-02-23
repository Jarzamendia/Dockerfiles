FROM memcached:1.5.12-alpine

CMD ["memcached"]

EXPOSE 11211

# Build args.
ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

# Labels.
LABEL maintainer "jearzamendia@gmail.com" description "Joao E. Arzamendia"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="jarzamendia/memcached"
LABEL org.label-schema.description="A simple and robust FastCGI Process Manager for PHP"
LABEL org.label-schema.url="https://memcached.org/"
LABEL org.label-schema.vcs-url="https://github.com/jarzamendia/memcached"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="memcached.org/"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run -it jarzamendia/memcached:tag"