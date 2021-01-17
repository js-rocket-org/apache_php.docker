#!/usr/bin/env sh

# run multiple PHP FPM versions in the background
service php5.6-fpm start
service php7.3-fpm start
service php7.4-fpm start

# run apache in background
service apache2 start;

# run memcached in background
service memcached start

# run postfix in background
service postfix start

# Docker needs this to keep the container running.
# alternatively you can start apache in the foreground like this:
#   apachectl -DFOREGROUND -k start
/bin/sh
