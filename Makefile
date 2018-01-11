.PHONY: default usage setup build test verify movie-api web-client
default: usage

usage:
	@echo
	@echo 'Usage: make <action>'
	@echo
	@echo '    setup                install dependencies'
	@echo '    test                 run unit tests'
	@echo '    verify               run unit tests with linting'
	@echo

# install dependencies
setup:
	make -C movie-api $(MAKECMDGOALS)
	make -C web-client $(MAKECMDGOALS)

test:
	make -C movie-api $(MAKECMDGOALS)
	# make -C web-client $(MAKECMDGOALS)

verify:
	make -C movie-api $(MAKECMDGOALS)
	make -C web-client lint

movie-api:
	make -C movie-api verify

web-client:
	make -C web-client lint
