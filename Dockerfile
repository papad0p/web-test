# Use an official PHP image with Apache as the base image
FROM php:8.2-apache

# Set the working directory
WORKDIR /var/www/html

# Copy source code
COPY . /var/www/html

# Install necessary PHP extensions
RUN docker-php-ext-install pdo_mysql

# Use environment variable to set Apache listen port
# Apache default config listens on port 80, so we replace that with $PORT
RUN sed -i 's/Listen 80/Listen ${PORT}/' /etc/apache2/ports.conf && \
    sed -i 's/:80/:${PORT}/' /etc/apache2/sites-available/000-default.conf

# Expose the port Cloud Run will use
EXPOSE 8080

# Command to start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
