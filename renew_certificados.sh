#!/bin/sh

#Esse script roda pelo menos uma vez por dia e verifica se o certificado está expirado.

#cd /app/nginx
#echo  '---------------------------------------------------------------------------------------------------' >> /app/nginx/log_renew
#date >> /app/nginx/log_renew
#docker-compose run --rm  certbot certonly --force-renewal --webroot --webroot-path /var/www/certbot/ -d applicacao.dev.br -d www.applicacao.dev.br >>  /app/nginx/log_renew
#docker-compose kill -s SIGHUP nginx_dev
