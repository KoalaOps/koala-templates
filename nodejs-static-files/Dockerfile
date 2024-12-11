FROM node:22-alpine

# Set working directory
WORKDIR /app

# Install http-server globally
RUN npm install -g http-server

# Copy the application files
COPY ./static .

# Copy the entry point script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use the entry point script
ENTRYPOINT ["/entrypoint.sh"]
