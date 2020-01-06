BASE := chaudhryfaisal
NAME := google-cloud-sdk
GITCOMMIT := $(shell git rev-parse --short=10 HEAD 2>/dev/null)

BASE_IMAGE_URL := $(BASE)/$(NAME)
IMAGE_URL := $(BASE_IMAGE_URL):$(GITCOMMIT)

build:
	docker build --pull -t ${IMAGE_URL} .

push: build
	docker push ${IMAGE_URL}
	docker tag ${IMAGE_URL} $(BASE_IMAGE_URL):latest
	docker push $(BASE_IMAGE_URL):latest

