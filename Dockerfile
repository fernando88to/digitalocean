FROM nginx:1.17.9

COPY ./default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD touch /myfile.txt