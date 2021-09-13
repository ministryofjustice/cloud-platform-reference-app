IMAGE := 754256621582.dkr.ecr.eu-west-2.amazonaws.com/webops/cloud-platform-reference-app-ecr
TAG := latest

docker-build: .built-docker-image

.built-docker-image: Dockerfile makefile
	docker build -t $(IMAGE) .
	touch .built-docker-image

shell:
	docker run --rm -it $(IMAGE):$(TAG) bash

tag:
	docker tag $(IMAGE) $(IMAGE):$(TAG)

push: .built-docker-image
	docker tag $(IMAGE) $(IMAGE):$(TAG)
	docker push $(IMAGE):$(TAG)

go-build:
	go build wiki.go
