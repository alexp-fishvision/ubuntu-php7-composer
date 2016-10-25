FROM ubuntu:xenial
MAINTAINER Alex Price <alexp@fishvision.com>

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install wget curl git zip unzip libxml2-dev
RUN apt-get update && \
    apt-get -y install \
    php7.0 \
    php7.0-cgi \
    php7.0-cli \
    php7.0-common \
    php7.0-curl \
    php7.0-dev \
    php7.0-gd \
    php7.0-gmp \
    php7.0-json \
    php7.0-ldap \
    php7.0-mysql \
    php7.0-odbc \
    php7.0-opcache \
    php7.0-pspell \
    php7.0-readline \
    php7.0-sqlite3 \
    php7.0-tidy \
    php7.0-xmlrpc \
    php7.0-xsl \
    php7.0-fpm \
    php7.0-intl \
    php7.0-mcrypt \
    php7.0-mbstring \
    php7.0-zip
RUN apt-get clean
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer creates=/usr/local/bin/composer
RUN /usr/local/bin/composer global require "fxp/composer-asset-plugin:~1.1.1"
