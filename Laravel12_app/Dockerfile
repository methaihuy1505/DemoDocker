FROM php:8.4-fpm

# Cài system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    curl \
    git \
    && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd

# Cài Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set thư mục làm việc
WORKDIR /var/www

# Copy source code
COPY . .

# Cấp quyền cho Laravel
RUN chown -R www-data:www-data /var/www \
    && chmod -R 775 storage bootstrap/cache

# Cài package PHP
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# TẠO APP_KEY TỰ ĐỘNG (FIX LỖI MissingAppKeyException)
RUN if [ ! -f .env ]; then cp .env.example .env; fi \
    && php artisan key:generate --force

# PHP-FPM lắng nghe cổng 9000
EXPOSE 9000

# Chạy PHP-FPM
CMD ["php-fpm"]
