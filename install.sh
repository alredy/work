# import repository key
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
# Add the repository 
echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
# Install docker
apt-get update ; apt-get install -y lxc-docker
#Git clont
cd /home/ 
git clone https://github.com/alredy/work.git
cd /home/work/docker/nginx
docker build -t nginx .



