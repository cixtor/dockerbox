FROM php:5.6-apache

RUN apt-get update \
&& apt-get install -y -q vim curl wget tree unzip mysql-client libmcrypt-dev \
&& pecl install xdebug \
&& docker-php-ext-enable xdebug \
&& docker-php-ext-install mcrypt \
&& docker-php-ext-install mysqli \
&& echo "xdebug.cli_color = 1" 1>> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.dump_once = On" 1>> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.auto_trace = Off" 1>> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.dump_globals = On"1>> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.extended_info = On" 1>> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.default_enable = On"1>> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "xdebug.coverage_enable = On" 1>> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
