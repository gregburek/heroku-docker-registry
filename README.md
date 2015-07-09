# A DEPRECATED Private, TLS and Auth protected Docker Registry, on Heroku

This app used the python docker registry which is no longer maintaned.
Currently, this app does not run on Heroku out of the box and is deprecated.

Deploy your own damn app:

1. Get an AWS bucket
2. Push this button: [![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/gregburek/heroku-docker-registry)
3. `docker login https://<your-cool-app-name>.herokuapp.com`

A new app will be deployed to your Heroku account, using AWS s3 as a storage
backend and heroku-postgresql as the search index. Also, free bugsnag and new
relic addons will be provisioned, which may require a credit card to prove you
are not a robot.

## What is this BS?

[Docker Registry](https://github.com/docker/docker-registry) is a python
application and a python module. This repo includes it in
[`requirements.txt`](https://github.com/gregburek/heroku-docker-registry/blob/master/requirements.txt#L1),
and deploys it to Heroku as a web app.

The [nginx buildpack](https://github.com/ryandotsmith/nginx-buildpack) provides
https redirects and basic auth to control access to your registry. Details
about the nginx setup can be found on my
[heroku-tls-auth-nginx-sample](https://github.com/gregburek/heroku-tls-auth-nginx-sample)
repo. Using the herokuapp.com ssl cert is simple and free.

Thanks to `app.json` and the [Heroku
Button](https://blog.heroku.com/archives/2014/8/7/heroku-button), your app is
automatically configured to use an s3 backend and a postgres db as a search
index.  The included `config.yml` file is used to wire up bugsnag api tokens
and the `DATABASE_URL` db uri.

Please file issues and send PRs.

## Advanced user configuration

`app.json` sets `REGISTRY_USERNAME` and `REGISTRY_PASSWORD` which have full
read and write access to the registry. For more fine-grained control, these
configs are also respected:

* `REGISTRY_USERS`: a `,`-separated list of `username:password` pairs. These users have full access to the registry. Example: `greg:hithere,dan:hello`
* `REGISTRY_RO_USERS`: a `,`-separated list of `username:password` pairs. These users have read-only access to the registry. Example: `build:secret,deploy:moresecret`

`REGISTRY_RO_USERS` is useful for use with build and deploy authentication where
pushing to the registry is not required. Items in `REGISTRY_USERS` are merged with
`REGISTRY_RO_USERS` so there should be no overlap between them.

## Local Development

On OS X install a few homebrew packages: python, xz

```
$ pip install virtualenv
$ virtualenv venv
$ source venv/bin/activate
$ pip install -r requirements.txt
$ DOCKER_REGISTRY_CONFIG=$(pwd)/config.yml gunicorn --access-logfile - --error-logfile - --debug -k gevent -b 0.0.0.0:5000 -w 4 --max-requests 100 docker_registry.wsgi:application
```
