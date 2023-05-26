FROM debian:buster

# Install NGINX
RUN apt-get update && apt-get install -y nginx openssl

# Create directory for certificates
RUN mkdir -p /etc/nginx/certs
# Generate self-signed certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certs/nginx-selfsigned.key -out /etc/nginx/certs/nginx-selfsigned.crt -subj "/C=US/ST=California/L=San Francisco/O=My Company/OU=DevOps/CN=oalaoui-.42.fr"

# Copy NGINX configuration file
COPY ./cnf/default.conf /etc/nginx/sites-enabled/default


# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
