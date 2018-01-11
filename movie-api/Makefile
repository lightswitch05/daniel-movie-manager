.PHONY: default usage setup build test
default: usage

usage:
	@echo
	@echo 'Usage: make <action>'
	@echo
	@echo '    setup                install dependencies'
	@echo '    build                build docker image'
	@echo '    test                 run unit tests'
	@echo '    verify               run unit tests with linting'
	@echo

# install dependencies
setup:
	@bundle install
	@RAILS_ENV=development bundle exec rake db:migrate
	@RAILS_ENV=test bundle exec rake db:migrate

# build docker image
build: test
	@docker login
	@docker build -t lightswitch05/track-my-vids:0.0.1 .
	@docker push lightswitch05/track-my-vids:0.0.1

test:
	@RAILS_ENV=test bundle exec rails test

verify: test
	@bundle exec rake validate
