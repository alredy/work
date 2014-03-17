FROM ubuntu:13.10
CMD apt-get install -y software-properties-common
CMD add-apt-repository -y ppa:nginx/stable
CMD apt-get update
CMD apt-get install -y nginx
CMD echo "\ndaemon off;" >> /etc/nginx/nginx.conf
EXPOSE 80
ENTRYPOINT ["nginx"]
