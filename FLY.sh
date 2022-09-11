#! /bin/bash

 if [ ! -x /var/lib/docker ]; then
 echo "INSTALLING docker"
 echo "Y" | apt install apt-transport-https ca-certificates curl software-properties-common
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
 echo "Y" | apt update
 apt-cache policy docker-ce
 echo "Y" | sudo apt install docker-ce
 echo "docker successfully installed"
   else
   echo "DOCKER ALREADY INSTALLED"
   fi

sudo docker build --tag alfred .
sudo docker run -d alfred

sudo mkdir -p /var/lib/mysql
sudo docker run --detach --name=alfred --volume=/var/lib/mysql:/var/lib/mysql alfred
sudo docker run --detach --name=alfred --volume=~/BATCAVE alfred

if [ $( docker ps -a | grep alfred | wc -l ) -gt 0 ]; then
  echo "testContainer exists"
 sudo docker rm  alfred --force
 sudo docker run --detach --name=alfred --volume=/var/lib/mysql:/var/lib/mysql alfred
else
  echo "testContainer does not exist"
 sudo docker run --detach --name=alfred --volume=/var/lib/mysql:/var/lib/mysql alfred 
fi


mysql -u admin -p admin1 < db.sql

