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
    sudo \
    vim \
    --no-install-recommends && rm -r /var/lib/apt/lists/*

# install ssh2 module
RUN \
	pecl install ssh2 \
	&& echo "extension=ssh2.so" > /usr/local/etc/php/conf.d/ext-ssh2.ini

# Do Apache Configuration
SHELL ["/bin/bash", "-c"]

# Copy site files  # Using Volume Mount to develop code
COPY src/ /var/www/html/

# Make ssh dir for root
RUN mkdir /root/.ssh/
ADD id_ed25519 /root/.ssh/id_ed25519
ADD id_ed25519.pub /root/.ssh/id_ed25519.pub
RUN ssh-keyscan -H github.com >> /root/.ssh/known_hosts

# Make ssh dir for www-data
RUN mkdir /var/www/.ssh/
ADD id_ed25519 /var/www/.ssh/id_ed25519
ADD id_ed25519.pub /var/www/.ssh/id_ed25519.pub
RUN chown -R www-data:www-data /var/www/.ssh
RUN chmod 0700 /var/www/.ssh
RUN chmod 0600 /var/www/.ssh/id_ed25519

RUN ssh-keyscan -H github.com >>/var/www/.ssh/known_hosts

# Copy XML files
RUN git clone git@github.com:ThanGrove/thlxmltest.git /var/www/thlxml

RUN chown -R www-data:www-data /var/www/thlxml