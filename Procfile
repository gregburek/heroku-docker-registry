web: bin/start-nginx gunicorn --access-logfile - --log-file - --debug -k gevent -b unix:/tmp/nginx.socket -w 1 docker_registry.wsgi:application
