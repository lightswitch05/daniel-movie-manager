.PHONY: default usage setup build test
default: usage

usage:
	@echo
	@echo 'Usage: make <action>'
	@echo
	@echo '    setup                install dependencies'
	@echo '    serve                run development server'
	@echo '    build                build docker image'
	@echo '    test                 run unit tests'
	@echo '    verify               run unit tests with linting'
	@echo

setup:
	@bundle install
	@RAILS_ENV=development bundle exec rake db:migrate
	@RAILS_ENV=test bundle exec rake db:migrate

serve:
	@RAILS_ENV=development bundle exec rails server -b 0.0.0.0

build-docker: test
#	@docker login
	@docker build -t lightswitch05/movie-api:dev .
#	@docker push lightswitch05/movie-api:0.0.1

test:
	@RAILS_ENV=test bundle exec rails test

verify: test lint

lint:
	@bundle exec rake validate
