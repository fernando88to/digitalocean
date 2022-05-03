FROM nginx:1.17.9

#COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
#EXPOSE 80
CMD touch /myfile.txt
EXPOSE 80 443

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]