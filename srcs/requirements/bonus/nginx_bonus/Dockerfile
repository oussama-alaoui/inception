FROM debian:buster

# Install NGINX
RUN apt-get update && apt-get install -y nginx openssl

# Copy NGINX configuration file
COPY ./cnf/default.conf /etc/nginx/sites-enabled/default

# copy site folder to container
COPY ./static_page /var/www/html

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
