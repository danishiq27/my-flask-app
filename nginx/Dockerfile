FROM nginx:latest

# Copy custom Nginx configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf
COPY flask_app.conf /etc/nginx/conf.d/flask_app.conf
COPY proxy_params /etc/nginx/proxy_params
COPY options-ssl-nginx.conf /etc/letsencrypt/options-ssl-nginx.conf
COPY certs /etc/letsencrypt/live/flaskblog.chickenkiller.com/
COPY ssl-dhparams.pem /etc/letsencrypt/ssl-dhparams.pem

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Expose ports
EXPOSE 80
EXPOSE 443

# Use the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
