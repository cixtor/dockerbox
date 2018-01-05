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
&& echo "xdebug.coverage_enable = On" 1>> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
&& echo "sendmail_path = mhsendmail --smtp-addr=mail:1025" 1>> /usr/local/etc/php/conf.d/docker-php-ext-sendmail.ini \
&& wget -q "https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64" -O /usr/local/bin/mhsendmail \
&& wget -q "https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" -O /usr/local/bin/wp \
&& wget -q "https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar" -O /usr/local/bin/phpcbf \
&& wget -q "https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar" -O /usr/local/bin/phpcs \
&& wget -q "https://phar.phpunit.de/phpunit.phar" -O /usr/local/bin/phpunit \
&& wget -q "http://phpdoc.org/phpDocumentor.phar" -O /usr/local/bin/phpdoc \
&& chmod 755 /usr/local/bin/mhsendmail \
&& chmod 755 /usr/local/bin/phpunit \
&& chmod 755 /usr/local/bin/phpdoc \
&& chmod 755 /usr/local/bin/phpcbf \
&& chmod 755 /usr/local/bin/phpcs \
&& chmod 755 /usr/local/bin/wp
