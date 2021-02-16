FROM php:5-apache

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY thl_apache2.conf /etc/apache2/conf-enabled/

# Do PHP Configuration
COPY php.ini $PHP_INI_DIR/conf.d/

RUN apt-get update && apt-get install -y \
    openssh-client \
	libssh2-1 \
	libssh2-1-dev \
    git \
    vim \
    --no-install-recommends && rm -r /var/lib/apt/lists/*

# install ssh2 module
RUN \
	pecl install ssh2 \
	&& echo "extension=ssh2.so" > /usr/local/etc/php/conf.d/ext-ssh2.ini

# Do Apache Configuration
SHELL ["/bin/bash", "-c"]

# Copy site files  # Using Volume Mount to develop code
# COPY src/ /var/www/html/
# Make ssh dir
RUN mkdir /root/.ssh/
ADD id_rsa /root/.ssh/id_rsa

# Copy XML files
# RUN git clone https://github.com/ThanGrove/thlxmltest.git /var/www/thlxml

# RUN chown -R www-data:www-data /var/www/thlxml