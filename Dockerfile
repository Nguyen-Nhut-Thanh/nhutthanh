FROM php:8.2-cli

# Cài đặt PostgreSQL extension
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Copy toàn bộ mã nguồn vào container
COPY . /App
WORKDIR /App

# Expose cổng Render yêu cầu
EXPOSE 10000

# Chạy PHP server tại thư mục public (thường có index.php ở đó)
CMD ["php", "-S", "0.0.0.0:10000", "-t", "public"]
