# Pull base image.
FROM httpd:alpine

# Install Apache Modules
RUN apk add apache2-proxy && apk add apache2-utils

# Configure httpd
COPY httpd.conf  /usr/local/apache2/conf/httpd.conf

# Create the proxy DBM
COPY proxy_map.txt  /usr/local/apache2/
RUN httxt2dbm -i /usr/local/apache2/proxy_map.txt -o /usr/local/apache2/proxy_map