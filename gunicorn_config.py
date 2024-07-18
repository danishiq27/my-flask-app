import multiprocessing

# Server Socket
bind = '0.0.0.0:5000'
#bind = 'unix:/home/ubuntu/flask_app/flask_app.sock'
umask = 0o007
backlog = 2048

# Worker Processes
workers = 3
worker_class = 'gevent'
threads = 2
worker_connections = 1000
timeout = 30
keepalive = 2

# Logging
accesslog = '-'  # Log to stdout
errorlog = '-'   # Log to stderr
#accesslog = '/usr/src/app/logs/access.log'
#errorlog = '/usr/src/app/logs/error.log'
loglevel = 'info'

# Process Name
proc_name = 'flask_blog'

# Security
# Limit request line size
limit_request_line = 4094
# Limit request header field size
limit_request_fields = 100
limit_request_field_size = 8190
preload_app = True


