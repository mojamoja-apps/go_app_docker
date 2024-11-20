FROM almalinux:9.4

RUN dnf update -y
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
RUN rpm -q epel-release
RUN dnf -y install https://rpms.remirepo.net/enterprise/remi-release-9.rpm -y
RUN rpm -q remi-release
RUN dnf module reset php -y
RUN dnf module enable php:remi-7.4 -y
RUN dnf install -y \
    golang \
    procps \
    # nginx \
    httpd \
    vim \
    zip \
    unzip \
    git \
    nodejs \
    wget \
    npm \
    # g++は、AlmaLinuxではgcc-c++というパッケージ名
    gcc-c++ \
    make \
    ruby \
    ruby-devel \
    rubygems \
    libjpeg-turbo-devel \
    libpng-devel

RUN dnf install -y \
    php \
    php-fpm \
    php-mbstring \
    php-xml \
    php-gd \
    php-pear \
    php-mysql \
    php-zip \
    php-pear \
    # for CakePHP
    php-intl \
    php-devel

# mailcatcherのインストール
# https://goodlife.tech/posts/mailcatcher.html
# RUN gem install mailcatcher

# composerのインストール
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# # ドキュメントルートを変更する（必要に応じて修正）
# ENV NGINX_DOCUMENT_ROOT='/home/develop/htdocs/'
# # Nginxの設定ファイルを置き換え
# COPY nginx.conf /etc/nginx/nginx.conf

# コンテナログイン時のパスを最後に指定
WORKDIR /home/develop

# php.iniをコピー
COPY php.ini /etc/

# 初期実行コマンドが複数ある場合は別ファイルにまとめる必要がある
COPY startup.sh /startup.sh
RUN chmod 744 /startup.sh
CMD ["/startup.sh"]


