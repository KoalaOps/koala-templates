FROM nginx:alpine AS production

# Copy custom Nginx configuration
COPY ./nginx.conf.template /etc/nginx/nginx.conf

COPY ./static /usr/share/nginx/html/
# Expose the default port
EXPOSE 8080

# Start Nginx
# CMD envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && cat /etc/nginx/nginx.conf && nginx -g 'daemon off;'
CMD nginx -g 'daemon off;'