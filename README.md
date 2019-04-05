# WikiJS

## Introduction

Wiki.js - A modern, lightweight and powerful wiki app built on NodeJS, Git and Markdown (https://wiki.js.org/)

## Building and running

```
sudo docker build -t wiki.js .

sudo docker network create wiki_network --subnet 110.10.0.0/24 --gateway 110.10.0.1

sudo docker run --name mongodb --network wiki_network --ip 110.10.0.100 -p 27017:27017 -d mongo:3

sudo docker run --name wiki \
--network wiki_network \
--ip 110.10.0.200 -p 80:80 \
-v $(pwd)/config.yml:/var/wikijs/config.yml \
-v $(pwd)/data:/var/wikijs/data \
-v $(pwd)/repo:/var/wikijs/repo \
-e WIKI_JS_HEROKU=1 \
-e WIKI_ADMIN_EMAIL=admin@email.com \
-d wiki.js
```
Hit the below URL in your browser:
http://loclahost:80/

Username: admin@email.com

Password: admin123 (Change password after logging in)

Hint: You can generate the config.yml file manually by using UI.
      Just uncomment the EXPOSE and CMD in Dockerfile. Run http://loclahost:3000/
