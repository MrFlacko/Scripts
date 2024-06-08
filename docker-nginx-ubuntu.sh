####################################################################################################
#### STAHHPP This is not a script, these are commands. Don't run as a script or I CHOP FINGERS! ####
####################################################################################################

## Install and do your main updates first whily setting up ssh
sudo apt update && sudo apt upgrade -y
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
sudo ufw status numbered
sudo ufw delete 3
echo y | sudo ufw delete 3
sudo ufw allow from 10.0.0.88 to any port 22 proto tcp
ssh flacko@10.0.0.4
sudo su

## Dependencies
sudo apt install net-tools apt-transport-https software-properties-common certbot git curl -y

## Docker Install Script
# https://docs.docker.com/engine/install/ubuntu/
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh --dry-run


## Certbot
certbot certonly -d server.flacko.net
# plexusmcnetwork@gmail.com
# 1
# y
# y

## Nginx Install https://hub.docker.com/_/nginx/
## https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-docker/
#non root (exit if root #)
mkdir -p /home/flacko/website/html
mkdir -p /home/flacko/website/nginx-conf
echo "<html><body><h1>My Website</h1></body></html>" > /home/flacko/website/html/index.html
nano /home/flacko/website/nginx-conf/default.conf

##########################################################################
## NGINX Configuration for /home/flacko/website/nginx-conf/default.conf ##
##########################################################################

server {
    listen 80;
    server_name server.flacko.net;

    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}

server {
    listen 443 ssl;
    server_name server.flacko.net;

    ssl_certificate /etc/letsencrypt/live/server.flacko.net/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/server.flacko.net/privkey.pem;

    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}

##########################################################################

## Docker Run
sudo su 
docker run -d \
  -p 80:80 \
  -p 443:443 \
  --name my-nginx \
  -v /home/flacko/website/html:/usr/share/nginx/html:ro \
  -v /etc/letsencrypt/live/server.flacko.net/fullchain.pem:/etc/letsencrypt/live/server.flacko.net/fullchain.pem:ro \
  -v /etc/letsencrypt/live/server.flacko.net/privkey.pem:/etc/letsencrypt/live/server.flacko.net/privkey.pem:ro \
  -v /home/flacko/website/nginx-conf:/etc/nginx/conf.d:ro \
  nginx

#Checking
netstat -plunt
