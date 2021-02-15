FROM php:7.2-apache

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY thl_apache2.conf /etc/apache2/conf-enabled/

# Do Apache Configuration
SHELL ["/bin/bash", "-c"]

# Do PHP Configuration
COPY php.ini $PHP_INI_DIR/conf.d/

RUN apt-get update && apt-get install -y \
    vim \
    git

# Copy site files  # Using Volume Mount to develop code
# COPY src/ /var/www/html/

# Copy XML files
RUN git clone https://github.com/ThanGrove/thlxmltest.git /var/www/thlxml

RUN chown -R www-data:www-data /var/www/thlxml