#!/bin/bash

FOLDER=/opt/web
FILE=index.html

mkdir -p $FOLDER

if [ ! -f $FOLDER/$FILE ]; then
	curl -o $FOLDER/$FILE https://raw.githubusercontent.com/digitalemil/htmldummy/master/content.html 
fi

docker rm -f nginx

docker run --name nginx -p 8080:80 -v $FOLDER:/usr/share/nginx/html:ro -d nginx

