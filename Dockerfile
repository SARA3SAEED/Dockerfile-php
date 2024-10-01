# docker build -t php:v1 .
# docker run -p 5001:8000 php:v1
# port CMD "--host=0.0.0.0" 
# test on browser localhost:5001

# FROM php:8

# WORKDIR /app 

# RUN apt-get update -y && apt-get install -y openssl zip unzip git
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# COPY . .

# RUN composer install

# RUN cp .env.example .env

# RUN php artisan key:generate

# CMD ["php", "artisan", "serve", "--host=0.0.0.0"]



# ------------------------------------------

# image : docker build -t php:v3 .
# container:  docker run -p 5005:8000 php:v3

FROM php:8

WORKDIR /app

RUN apt-get update -y && apt-get install -y openssl zip unzip git \
    && apt-get install -y libzip-dev zip \
    && docker-php-ext-install zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY composer* . 

RUN composer install --no-scripts

COPY . .

RUN cp .env.example .env

RUN php artisan key:generate

CMD ["php", "artisan", "serve", "--host=0.0.0.0"]
