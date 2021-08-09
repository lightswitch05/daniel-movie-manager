# [Daniel's Movie Manager](http://daniel-movie-manager.us-east-1.elasticbeanstalk.com/)

[![Build Status](https://travis-ci.org/lightswitch05/daniel-movie-manager.svg?branch=master)](https://travis-ci.org/lightswitch05/daniel-movie-manager)

A demo application for storing a movie collection.

## [Environment](./environment/README.md)

  Vagrant project for setting up a reproducible development environment.

## [Movie API](./movie-api/README.md)

  Ruby on Rails app for RESTful APIs.

  Setup: `docker-compose run --rm rails new . --api --skip-javascript --skip-turbolinks --skip-action-mailbox --skip-active-job --skip-action-text --skip-sprockets --database=postgresql --skip-action-mailer`

## [Web Client](./web-client/README.md)

  Angular web app.
