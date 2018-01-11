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
	@echo

setup:
	@npm install --loglevel=error

test:
	@npm run test

verify: test lint

lint:
	@npm run lint
