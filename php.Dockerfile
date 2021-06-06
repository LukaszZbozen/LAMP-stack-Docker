FROM php:7.4-fpm

# copy everything in the project into the container. This is what
# makes this image so fast!
COPY . /src

# Removes 403 permissions error
COPY src/ /var/www/html/

WORKDIR /src

# Install Git
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

# INSTALL COMPOSER
RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# My sql extension installed and enabled
RUN docker-php-ext-install mysql && docker-php-ext-enable mysql



#Allocate port
# EXPOSE 9000

# -d runs as a service 