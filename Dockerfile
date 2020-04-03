FROM php:7.4.1-fpm-alpine3.11
# Install laravel requirement PHP package
RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS libzip-dev sqlite-dev \
            libpng-dev libxml2-dev oniguruma-dev libmcrypt-dev curl curl-dev libcurl postgresql-dev
RUN docker-php-ext-install -j$(nproc) gd bcmath zip pdo_mysql pdo_pgsql
RUN pecl install mcrypt-1.0.3 xdebug swoole && docker-php-ext-enable mcrypt swoole
# Install composer
ENV COMPOSER_HOME /composer
ENV PATH ./vendor/bin:/composer/vendor/bin:$PATH
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

# Install PHP_CodeSniffer
RUN composer global require "squizlabs/php_codesniffer=*"
WORKDIR /app
CMD [ 'php' ]
