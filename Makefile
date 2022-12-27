ASROOT := "root:root"
ASUSER := "$(shell id -u):$(shell id -g)"

all: \
	image \
	volume \
	setup

image:
	docker build -t nvim . \
		--build-arg UID=$(shell id -u) \
		--build-arg GID=$(shell id -g) \
		--build-arg HOME=$(HOME) \
		--build-arg NAME=$(shell id -u -n) \
		--build-arg GROUP=$(shell id -g -n)

volume:
	docker volume create nvim

network:
	test ! -z "$(shell docker network ls | grep no-internet)" \
		|| docker network create --internal --subnet 10.254.254.0/24 no-internet 

run:
	docker run -it -v nvim:/data:z -u $(ID) --entrypoint /bin/bash nvim:latest -c "$(CMD)"

setup:
	@$(MAKE) run ID=$(ASROOT) CMD="chown -R $(ASUSER) /data"
	@$(MAKE) run ID=$(ASUSER) CMD="test -d /data/config || mkdir -p /data/config"
	@$(MAKE) run ID=$(ASUSER) CMD="test -d /data/local 	|| mkdir -p /data/local"
	@$(MAKE) run ID=$(ASUSER) CMD="test -d ~/.config/nvim/.git \
		|| (cd ~/.config/nvim && git init && git remote add origin https://github.com/nyarla/dotnvim-v2 && git pull origin main)"
	@$(MAKE) run ID=$(ASUSER) CMD="cd ~/.config/nvim && git restore --staged . && git restore . && git pull origin main"

shell:
	@$(MAKE) run ID=$(ASUSER) CMD="cd ~/; bash --login"

root:
	@$(MAKE) run ID=$(ASROOT) CMD="cd ~/; bash --login"

edit:
	@docker run -it -v nvim:/data:ro -u $(ASUSER) \
		--net none \
		--mount type=bind,src=$(shell pwd),dst=$(shell pwd) \
		--entrypoint /usr/bin/nvim nvim:latest "$(shell pwd)"

edit-with-net:
	@docker run -it -v nvim:/data:z -u $(ASUSER) \
		--entrypoint /usr/bin/nvim nvim:latest "$(shell pwd)"

