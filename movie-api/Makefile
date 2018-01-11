.PHONY: default usage
default: usage

usage:
	@echo
	@echo 'Usage: make <action>'
	@echo
	@echo '    setup     install dependencies'
	@echo '    build     build docker image'
	@echo

# install dependencies
setup:
	@bundle install

# build docker image
build:
	@docker build -t lightswitch05/track-my-vids:0.0.1 .
	@docker push lightswitch05/track-my-vids:0.0.1
