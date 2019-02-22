FROM php:7.2-fpm-alpine

COPY ntpd.conf /etc/ntpd.conf

#Primeiro vamos atualizar os pacotes existentes, e instalar os requisitos de nosso PHP.

RUN apk update && \
    apk add --no-cache libmemcached-dev \
            libmcrypt-dev \
            libxml2-dev \
            imagemagick-dev \
            pcre-dev \
            libtool \
            autoconf \
            g++ \
            cyrus-sasl-dev \
            libgsasl-dev \
            libzip-dev \
            make \
            ca-certificates \
            tzdata \
            shadow 

RUN echo "export LANG=pt_BR.UTF-8" > /etc/profile.d/locale.sh && \
    cp /usr/share/zoneinfo/America/Campo_Grande /etc/localtime && \
    echo "America/Campo_Grande" >  /etc/timezone && \
    apk del tzdata && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

RUN docker-php-ext-install mysqli mbstring pdo pdo_mysql tokenizer xml

#Agora vamos instalar alguns pacotes adicionais.
#É importante verificar que o mcrypt deve ser ajustado de acordo com a versão do PHP.

#Ja adicionei o redis também... Vamos facilitar nossa vida...
RUN pecl channel-update pecl.php.net \
    && pecl install memcached \
    && pecl install imagick \
    && pecl install mcrypt-1.0.2 \
    && pecl install -o -f redis \
    && docker-php-ext-enable redis \
    && docker-php-ext-enable memcached \
    && docker-php-ext-enable imagick \
    && docker-php-ext-enable mcrypt

RUN pecl install zip

#Vamos copiar os arquivos de configuração do Laravel.
COPY ./custom.ini /usr/local/etc/php/conf.d
COPY ./pool.conf /usr/local/etc/php-fpm.d/

#Limpar o cache de aplicativos. Menos é mais.
RUN rm /var/cache/apk/*

#O usermod vem no pacote shadow.
RUN usermod -u 1000 www-data

WORKDIR /var/www

CMD ["php-fpm"]

EXPOSE 9000

# Build args.
ARG BUILD_DATE
ARG VCS_REF
ARG BUILD_VERSION

# Labels.
LABEL maintainer "jearzamendia@gmail.com" description "Joao E. Arzamendia"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.name="jarzamendia/php"
LABEL org.label-schema.description="A simple and robust FastCGI Process Manager for PHP"
LABEL org.label-schema.url="https://php-fpm.org/"
LABEL org.label-schema.vcs-url="https://github.com/jarzamendia/nginx"
LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vendor="php-fpm.org"
LABEL org.label-schema.version=$BUILD_VERSION
LABEL org.label-schema.docker.cmd="docker run -it php:tag"