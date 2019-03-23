IMAGE_NAME = sabnzbd
DOCKER_HOST ?= ""
DOCKER_USER ?= roaanv/
VERSION_TAG ?= 2.3.8
FULL_IMAGE_NAME = $(DOCKER_HOST)$(DOCKER_USER)$(IMAGE_NAME)

all: image

image: build_image tag_latest

build_image: 
	docker build -t $(FULL_IMAGE_NAME):$(VERSION_TAG) .


push: image
	docker push $(FULL_IMAGE_NAME):$(VERSION_TAG)
	docker push $(FULL_IMAGE_NAME):latest

tag_latest:
	docker tag $(FULL_IMAGE_NAME):$(VERSION_TAG) $(FULL_IMAGE_NAME):latest

