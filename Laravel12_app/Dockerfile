FROM php:8.2-cli

# Cài extension Laravel cần
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libonig-dev libxml2-dev zip unzip curl git \
    && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Cài Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set thư mục làm việc
WORKDIR /var/www

# Copy toàn bộ source code Laravel từ máy local vào container
COPY . .

# Cấp quyền cho storage và bootstrap/cache
RUN chmod -R 775 storage bootstrap/cache

# Cài package PHP
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Expose port 8000
EXPOSE 8000

# Chạy Laravel dev server
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
