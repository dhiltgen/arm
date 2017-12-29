# Should work for raspberry pi 1 and 2
ORG=dhiltgen
ARCH:=$(shell docker info --format '{{.Architecture}}')

all: go

push:
	docker push $(ORG)/$(ARCH)-golang:1.9.2-alpine3.6
	docker push $(ORG)/$(ARCH)-node:7.10-alpine


go: Dockerfile.golang
	docker build -t $(ORG)/$(ARCH)-golang:1.9.2-alpine3.6 -f Dockerfile.golang .


node: Dockerfile.node
	docker build -t $(ORG)/$(ARCH)-node:7.10-alpine -f Dockerfile.node .
