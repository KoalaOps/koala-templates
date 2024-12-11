FROM nginx:alpine AS production

# Copy custom Nginx configuration
COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./static /usr/share/nginx/html/
# Expose the default port
EXPOSE 8080

# Start Nginx
CMD nginx -g 'daemon off;'