# Pull base image.
FROM httpd:alpine

# Install Apache Modules
RUN apk add apache2-proxy

# Configure httpd
COPY httpd.conf  /usr/local/apache2/conf/httpd.conf

# Create Virtualhosts
COPY proxy_map.txt  /usr/local/apache2/
COPY init-proxies.sh  /usr/local/apache2/
RUN /usr/local/apache2/init-proxies.sh /usr/local/apache2