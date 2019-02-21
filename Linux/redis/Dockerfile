FROM redis:5.0.3-alpine

VOLUME /data

EXPOSE 6379

CMD ["redis-server"]

# Build args.
ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

# Labels.
LABEL maintainer "jearzamendia@gmail.com" description "Joao E. Arzamendia"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="jarzamendia/redis"
LABEL org.label-schema.description="Redis is an open source (BSD licensed), in-memory data structure store, used as a database, cache and message broker."
LABEL org.label-schema.url="https://redis.io/"
LABEL org.label-schema.vcs-url="https://github.com/jarzamendia/redis"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="redis.io"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run  -d jarzamendia/redis"