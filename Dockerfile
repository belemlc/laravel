FROM php:7.3.6-fpm-alpine3.9

# Algumas extencoes
RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

# Diretorio de trabalho
WORKDIR /var/www

# Apaga o conteudo
RUN rm -rf /var/www/html

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 
# RUN composer install && \
#     cp .env.example .env && \
#     php artisan key:generate && \
#     php artisan config:cache

# Copia o conteudo para dentro da imagem
# COPY . /var/www

# Cria um link simbolico da pasta public
RUN ln -s public html

EXPOSE 9000

ENTRYPOINT ["php-fpm"]
