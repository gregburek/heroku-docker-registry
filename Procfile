web: bin/start-nginx gunicorn --access-logfile - --error-logfile - --debug -k gevent -b unix:/tmp/nginx.socket -w 1 docker_registry.wsgi:application
