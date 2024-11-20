#!/bin/bash

# php-fpm 実行用のディレクトリを作成
mkdir /run/php-fpm/

# php-fpm 起動
php-fpm

# # Nginxの起動
# nginx -g 'daemon off;'
# Apache起動
httpd -DFOREGROUND




