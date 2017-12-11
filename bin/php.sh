#!/usr/bin/env bash

EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid composer installer signature'
else
    php composer-setup.php --quiet

    mv composer.phar /usr/local/bin/composer
fi

rm composer-setup.php

composer global require laravel/valet
