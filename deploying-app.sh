#!/bin/bash
#This is an deployment script of an django app

git_clone(){
        git clone https://github.com/LondheShubham153/django-notes-app.git
        cd django-notes-app
}

install_requirements(){
        sudo apt update && sudo apt upgrade -y && sudo apt install -y  docker.io docker-compose nginx
}


perm_serv(){
        sudo chown "$USER"  /var/run/docker.sock
	#sudo chown "$USER" /home/ubuntu/shell-scripting/django-notes-app/data/mysql/db
        #sudo systemctl enable docker
        #sudo systemctl enable nginx
}

deploy(){
        docker build -t notes-app .
        docker-compose up -d
        #docker run -d -p 8000:8000 notes-app:latest
}


echo "####################################################################"
echo "DEPLOYMENT STARTED"
echo "####################################################################"

if ! git_clone; then
	echo "####################################################################"
        echo "Already exists"
	echo "####################################################################"
        cd django-notes-app
fi
install_requirements
perm_serv
if ! deploy; then
        #sudo systemctl stop nginx && sudo fuser -k 80/tcp 8000/tcp && docker compose up -d
        echo "####################################################################"
	echo "DEPLOYMENT FAILED"
	echo "####################################################################"
	exit 1
fi

echo "####################################################################"
echo "DEPLOYMENT DONE"
echo "####################################################################"                               


