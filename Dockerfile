FROM ubuntu:xenial
MAINTAINER Alex Price <alexp@fishvision.com>
ENV DEBIAN_FRONTEND noninteractive

# Remove sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install packages
RUN apt-get update
RUN apt-get -y install wget \
    curl \
    git \
    zip \
    unzip \
    libxml2-dev \
    build-essential \
    libssl-dev \
    vim \
    nano \
    openssh-client

# Install PHP
RUN apt-get -y install \
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
    php7.0-zip \
    php-xdebug

# Clean apt
RUN apt-get clean

# Install node
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash && \
    export NVM_DIR="/root/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && \
    nvm install 4.6 lts

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer creates=/usr/local/bin/composer
RUN php /usr/local/bin/composer global require "fxp/composer-asset-plugin:~1.1.1"
RUN php /usr/local/bin/composer global require "hirak/prestissimo:^0.3"

# Misc
RUN mkdir -p ~/.ssh
RUN [[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
