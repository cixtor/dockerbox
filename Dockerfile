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

# wp core download --path="/var/www/html" --allow-root
# wp core config --path="/var/www/html" --dbhost="mysql" --dbname="wordpress" --dbuser="admin" --dbpass="password" --extra-php="define(\"WP_DEBUG\", true);" --allow-root
# wp core install --url="wordpress.test" --path="/var/www/html" --admin_user="admin" --admin_email="admin@wordpress.test" --admin_password="password" --title="Blog" --allow-root
# wp rewrite structure "/%year%/%monthnum%/%postname%/" --path="/var/www/html" --allow-root
# wget "https://github.com/WP-API/Basic-Auth/archive/master.zip" -O /var/www/html/master.zip
# unzip -d /var/www/html/wp-content/plugins/ -- /var/www/html/master.zip
# wp plugin activate basic-auth --path="/var/www/html" --allow-root

# svn co --quiet "https://develop.svn.wordpress.org/trunk/tests/phpunit/data/" "/var/www/html/data"
# svn co --quiet "https://develop.svn.wordpress.org/trunk/tests/phpunit/includes/" "/var/www/html/includes"
# wget -q "https://develop.svn.wordpress.org/trunk/wp-tests-config-sample.php" -O "/var/www/html/wp-tests-config.php"
# sed -i "s:dirname( __FILE__ ) . '/src/':'/var/www/html/':" "/var/www/html/wp-tests-config.php"
# sed -i "s/youremptytestdbnamehere/wordpress/" "/var/www/html/wp-tests-config.php"
# sed -i "s/yourusernamehere/admin/" "/var/www/html/wp-tests-config.php"
# sed -i "s/yourpasswordhere/password/" "/var/www/html/wp-tests-config.php"
# sed -i "s/localhost/mysql/" "/var/www/html/wp-tests-config.php"
# sed -i "s/example\.org/wordpress.test/g" "/var/www/html/wp-tests-config.php"
