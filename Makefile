DOCKER_USER ?=
DOCKER_PASS_FILE ?=
DOCKER_PASS ?=
TAG ?= $$(git log --format="%H" -n 1)
PHP_FPM_PORT ?= 9000
NGINX_PORT ?= 8080
VERSION ?= latest

login:
ifdef DOCKER_PASS_FILE
	cat $(DOCKER_PASS_FILE) | docker login -u ${DOCKER_USER} --password-stdin
else
	docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
endif

build:
	docker build -t jrsaunders/redis-init:${TAG} . \
	&& docker tag jrsaunders/redis-init:${TAG} jrsaunders/redis-init:latest

push:
	docker push jrsaunders/redis-init




