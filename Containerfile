# Use the official httpd image as the base
FROM registry.access.redhat.com/ubi8/httpd-24

# Update the configuration to listen on port 8080 instead of 80
RUN sed -i 's/Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf

# Create a non-root user and ensure the web content directory is writable by this user
RUN useradd -u 1001 -r -g 0 -s /sbin/nologin -d /var/www www-data && \
    chown -R www-data:0 /usr/local/apache2/htdocs && \
    chmod -R 775 /usr/local/apache2/htdocs

# Switch to the non-root user
USER 1001

# Expose port 8080 for incoming traffic
EXPOSE 8080

# Command to run Apache in the foreground
CMD ["httpd-foreground"]

