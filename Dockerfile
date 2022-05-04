FROM nginx:1.17.9

COPY ./nginx/index.html /usr/share/nginx/html/index.html
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
#EXPOSE 80

EXPOSE 80 443

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]