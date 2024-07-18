#!/bin/bash

# Set the correct ownership and permissions
chown www-data:www-data /etc/letsencrypt/live/flaskblog.chickenkiller.com/*
chmod 644 /etc/letsencrypt/live/flaskblog.chickenkiller.com/*

# Start Nginx
nginx -g "daemon off;"

