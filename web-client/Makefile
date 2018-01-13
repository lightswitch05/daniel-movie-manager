.PHONY: default usage setup build test
default: usage

usage:
	@echo
	@echo 'Usage: make <action>'
	@echo
	@echo '    setup                install dependencies'
	@echo '    test                 run unit tests'
	@echo '    verify               run unit tests with linting'
	@echo '    lint                 run linting'
	@echo '    build                build static site in ./dist'
	@echo '    build-docker         build the docker image'
	@echo '    serve                start development server'
	@echo

setup:
	@npm install --loglevel=error

test:
	@npm run test

verify: test lint

lint:
	@npm run lint

build:
	@npm run build

serve:
	@npm run start

build-docker:
#	@docker login
	@docker build -t lightswitch05/web-client:dev .
#	@docker push lightswitch05/web-client:0.0.1
