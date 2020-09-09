# Copyright 2016 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifeq ($(REGISTRY),)
        REGISTRY = quay.io/external_storage/
endif
ifeq ($(VERSION),)
        VERSION = latest
endif
IMAGE = $(REGISTRY)nfs-client-provisioner:$(VERSION)
IMAGE_ARM = $(REGISTRY)nfs-client-provisioner-arm:$(VERSION) 

all: build image

container: build image

build:
	CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' -o nfs-client-provisioner ./cmd/nfs-client-provisioner

image:
	docker build -t $(MUTABLE_IMAGE) docker/x86_64
	docker tag $(MUTABLE_IMAGE) $(IMAGE)

push:
	docker push $(IMAGE)
	docker push $(MUTABLE_IMAGE)
	docker push $(IMAGE_ARM)
	docker push $(MUTABLE_IMAGE_ARM)
