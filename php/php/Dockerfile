FROM php:8.2-fpm
RUN docker-php-ext-install pdo_mysql opcache

COPY ./php.ini "$PHP_INI_DIR/php.ini"
COPY ./opcache.ini "$PHP_INI_DIR/opcache.ini"



# Install xdebug
RUN pecl install xdebug-3.3.2
RUN docker-php-ext-enable xdebug
    
#COPY ./xdebug.ini "/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini"
COPY ./xdebug.ini "${PHP_INI_DIR}/conf.d"
COPY ./www.conf /usr/local/etc/php-fpm.d/www.conf

