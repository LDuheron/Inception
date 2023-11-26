
#!/bin/bash

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
	bash /tmp/init_wp.sh;
fi

if [ ! -d /run/php ]; then
	mkdir /run/php;
fi

exec /usr/sbin/php-fpm7.4 -F -R