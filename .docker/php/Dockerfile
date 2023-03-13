FROM php:8.2-fpm
COPY .docker/php/php.ini /usr/local/etc/php/

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV COMPOSER_HOME=/composer

COPY --from=composer /usr/bin/composer /usr/bin/composer

# todo 何をインストールしたらいいか調査
ENV NGINX_DOCUMENT_ROOT /var/www/html
ENV LC_ALL C.UTF-8

RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    apt-transport-https \
    apt-utils \
    build-essential \
    curl \
    debconf-utils \
    gcc \
    git \
    vim \
    gnupg2 \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libpq-dev \
    libzip-dev \
    locales \
    ssl-cert \
    unzip \
    zlib1g-dev \
    memcached \
    libmemcached-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && echo "en_US.UTF-8 UTF-8" >/etc/locale.gen \
  && locale-gen

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
  && docker-php-ext-install -j$(nproc) zip gd mysqli pdo_mysql opcache intl pgsql pdo_pgsql

WORKDIR /var/www
