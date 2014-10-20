web: gunicorn --access-logfile - --log-file - --debug -k gevent -b 0.0.0.0:$PORT -w 1 docker_registry.wsgi:application
