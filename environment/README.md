# Environments

## Setup

* Install Vagrant: https://www.vagrantup.com/
* `cd` into environment folder and provision VM: `vagrant up`

## Development

The environment is an Ubuntu VM with Ruby, Node, and Docker installed. It also has multiple PostgreSQL docker containers running ready for development use. 

* SSH into development environment: `vagrant ssh dev`
* Project source is in `~/daniel-movie-manager`
* Machine address is 192.168.8.1

## Integration

This environment is a bare bone Ubuntu VM with Docker installed. It has PostgreSQL and the application docker images running and configured. This is useful for integration testing before continuing to production. 

* SSH into integration environment: `vagrant ssh int`
* Access Movie API: http://192.168.8.2:3000/


## Cleanup

To remove both dev and int machines, run `vagrant destroy`

