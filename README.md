# A Docker Registry, on Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/gregburek/heroku-docker-registry)

As [docker-registry](https://github.com/docker/docker-registry/) is a python
module, it is possible, and [well
documented](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-private-docker-registry-on-ubuntu-14-04)
as a traditional python application. This project configures docker-registry to
be run with a postgresql index backend and s3 image storage.
