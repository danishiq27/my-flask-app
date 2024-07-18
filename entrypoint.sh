#!/bin/sh


# Run the Flask database commands
flask db init
flask db migrate -m "Initial migration"
flask db upgrade

# Start the Gunicorn server
exec gunicorn -c gunicorn_config.py wsgi:app

