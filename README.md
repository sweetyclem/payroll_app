# README

## Install

* [Install docker](https://docs.docker.com/install/#supported-platforms)
* [Install docker compose](https://docs.docker.com/compose/install/#install-compose) if not already installed

For linux, [add your user](https://docs.docker.com/install/linux/linux-postinstall/) to the docker group with the following

```bash
sudo usermod -aG docker $USER
```
## Start the server
```bash
docker-compose up
```

## Setup the database
```bash
docker exec -ti web rails db:create
docker exec -ti web rails db:migrate
```

To launch the tests :
```bash
docker exec -ti web rails test
```

## Import data
You can find the sample csv file in the storage folder of the app

## What I'm proud of
I'm proud it works, for one ! It's always amazing to be able to create things. I focused on the backend and devops aspect, because that's what I love :)  
I have done lots of software development in the past year and not much web so I'm proud I could manage the rails framework.  
I like that it runs on docker, allowing anyone to run it without having to install the ruby and rails versions I used.  
I spent a lot of time so I had to stop at some point but I would have liked to write more tests.  
I decided to keep everything in my database, since it was payroll data I figured keeping traces of everything is really important.
