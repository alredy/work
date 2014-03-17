FROM ubuntu
RUN apt-get install nginx -y
RUN rm /etc/nginx/sites-enabled/default
ADD proxy.conf /etc/nginx/sites-enabled/proxy
ADD nginx_run.sh /opt/nginx_run.sh
RUN chmod +x /opt/nginx_run.sh
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
EXPOSE 80
CMD /opt/nginx_run.sh
