FROM php:7.2-fpm
RUN apt-get update \
&& apt-get install -y \
	        bash \
	        wget \
            curl \
            git \
            vim \
	        supervisor \
	        nginx

RUN apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libmemcached-dev \
        libpng-dev \
        sendmail \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd mbstring pdo pdo_mysql



WORKDIR /usr/local/

#Composer and PHPUnit installation
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    curl -LsS https://phar.phpunit.de/phpunit.phar -o /usr/local/bin/phpunit && \
    chmod +x /usr/local/bin/phpunit
RUN composer self-update

#Custom Extension
RUN pecl install xdebug  && docker-php-ext-enable xdebug
RUN pecl install redis && docker-php-ext-enable redis
RUN docker-php-ext-install -j$(nproc) zip


RUN pecl channel-update pecl.php.net && pecl install mcrypt-1.0.1

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY manifest/config/nginx.conf /etc/nginx/nginx.conf
COPY manifest/config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY manifest/config/php.ini /usr/local/etc/php/php.ini
#COPY manifest/config/x-debug.ini /usr/local/etc/php/conf.d/x-debug.ini

RUN echo '' > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini



COPY app /app
RUN mkdir -p /run/nginx/
WORKDIR /app
EXPOSE 80 443
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]