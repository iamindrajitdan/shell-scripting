#!/bin/bash
#This is an deployment script of an django app

git_clone(){
        git clone https://github.com/LondheShubham153/django-notes-app.git
        cd django-notes-app
}

install_requirements(){
        sudo apt update && sudo apt install -y  docker.io docker-compose nginx
}


restart_services(){
        sudo chown "$USER"  /var/run/docker.sock
        sudo chmod 777 /home/ubuntu/shell-scripting/django-notes-app/data/mysql/db/#ib_16384_1.dblwr
        #sudo systemctl enable docker
        #sudo systemctl enable nginx
}

deploy(){
        docker build -t notes-app .
        docker-compose up -d
        docker run -d -p 8000:8000 notes-app:latest
}


echo "####################################################################"
echo "DEPLOYMENT STARTED"
echo "####################################################################"

if ! git_clone; then
        echo "Already exists"
        cd django-notes-app
fi
install_requirements
restart_services
if ! deploy; then
        sudo systemctl stop nginx && sudo fuser -k 80/tcp 8000/tcp && docker compose up -d
        deploy
fi

                                      
