FROM wordpress:cli-2.1.0-php7.1

# Build args.
ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

# Labels.
LABEL maintainer "jearzamendia@gmail.com" description "Joao E. Arzamendia"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="jarzamendia/wordpresscli"
LABEL org.label-schema.description="WP-CLI is the command-line interface for WordPress. You can update plugins, configure multisite installs and much more, without using a web browser."
LABEL org.label-schema.url="https://wp-cli.org/"
LABEL org.label-schema.vcs-url="https://github.com/jarzamendia/wordpress"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="Wordpress"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run -it -rm jarzamendia/wordpresscli command"