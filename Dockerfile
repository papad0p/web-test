# Use an official PHP image with Apache as the base image
FROM php:8.2-apache

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy the entire application code from the current directory on the host to the working directory in the container
COPY . /var/www/html

# Install any necessary PHP extensions (e.g., for database connectivity)
# Replace 'pdo_mysql' with extensions your application requires
RUN docker-php-ext-install pdo_mysql

# Expose port 80, the default HTTP port for Apache
EXPOSE 80

# Command to start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
