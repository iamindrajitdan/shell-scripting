#!/bin/bash
#This is an deployment script of an django app

git_clone(){
	git clone https://github.com/LondheShubham153/django-notes-app.git
	cd django-notes-app
}

install_requirements(){
	sudo apt-get install docker.io python nginx -y
}

restart_services(){
	sudo systemctl restart docker
	sudo systemctl restart nginx
}

build_docker_image(){
	docker build -t notes-app .
}

deploy(){
	docker run -d -p 8000:8000 notes-app:latest
}

