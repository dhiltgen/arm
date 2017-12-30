# Should work for raspberry pi 1 and 2
ORG=dhiltgen
ARCH:=$(shell docker info --format '{{.Architecture}}')

all: go

push:
	docker push $(ORG)/golang-$(ARCH):1.9.2-alpine3.6
	docker push $(ORG)/node-$(ARCH):7.10-alpine


go: Dockerfile.golang
	docker build -t $(ORG)/golang-$(ARCH):1.9.2-alpine3.6 -f Dockerfile.golang .


node: Dockerfile.node
	docker build -t $(ORG)/node-$(ARCH):7.10-alpine3.6 -f Dockerfile.node .
