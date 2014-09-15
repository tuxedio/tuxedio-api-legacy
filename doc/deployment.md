Deploy
=====

In order to deploy the application, we use [Docker](http://www.docker.com).
This allows us to container-ize our setup for which makes deployment and testing
simple.

###Steps to deploy:
  1. Install Docker
    - note: on OSX you can install boot2docker for a small Linux VM
    - Install VirtualBox
    - `$ brew install boot2docker docker`
    - `$ boot2docker init && boot2docker up`
    - `$ export DOCKER_HOST='INSERT_HOST_HERE'`
  2. Start persistent database container
    - `$ rake docker:db:data`
  3. Start Postgres container
    - `$ rake docker:db:start`
    - This creates a postgres container
  4. Start Rails container which links the links to the database
    - `$ rake docker:rails:server`
  5. Create database/run migrations if neccesary
    - `$ rake docker:db:create`
    - `$ rake docker:db:migrate`
  6. Navigate to browser at Docker host IP
    - `$ echo $DOCKER_HOST` to find IP address

tl;dr
  1. One command deploy
    - `$ rake docker:deploy`
