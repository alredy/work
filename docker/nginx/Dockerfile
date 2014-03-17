FROM ubuntu:13.10
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN apt-get install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
VOLUME /etc/nginx/sites-enabled
VOLUME /var/log/nginx
WORKDIR /etc/nginx
EXPOSE 80
ENTRYPOINT ["nginx"]
