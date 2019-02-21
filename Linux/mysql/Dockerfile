FROM mysql:5.7.25

#####################################
# Set Timezone
#####################################

COPY my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]

EXPOSE 3306

# Build args.
ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

# Labels.
LABEL maintainer "jearzamendia@gmail.com" description "Joao E. Arzamendia"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="jarzamendia/mysql"
LABEL org.label-schema.description="Mysql Server"
LABEL org.label-schema.url="https://dev.mysql.com/"
LABEL org.label-schema.vcs-url="https://github.com/jarzamendia/mysql"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="Oracle Corporation"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run -e MYSQL_ROOT_PASSWORD=my-secret-pw jarzamendia/mysql:tag"