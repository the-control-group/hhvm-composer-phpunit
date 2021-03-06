FROM ubuntu:14.04

MAINTAINER Chris McKenzie <chris.mckenzie@thecontrolgroup.com>

RUN apt-get -y -qq install software-properties-common && \
    apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 && \
    add-apt-repository "deb http://dl.hhvm.com/ubuntu $(lsb_release -sc) main" && \
    apt-get update && \
    apt-get --yes --force-yes install hhvm \
                                      curl \
                                      wget \
                                      git

RUN curl -sS https://getcomposer.org/installer | hhvm --php -d default_socket_timeout=30 && \
    mv composer.phar /usr/local/bin/composer

RUN wget -O /usr/local/bin/phpunit https://phar.phpunit.de/phpunit-old.phar && \
    chmod +x /usr/local/bin/phpunit
