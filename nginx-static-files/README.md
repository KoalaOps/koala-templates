 # Project Template: Nginx Static Site

This project template sets up an Nginx server to serve static files efficiently. It uses Docker to containerize the environment, ensuring consistency across development and production setups.

## Features

- **Nginx**: Lightweight and high-performance web server.
- **Static File Hosting**: Serves files from a `static` directory.
- **Secure Configuration**: Includes HTTP headers for improved security.
- **Dockerized Setup**: Simplifies deployment and ensures portability.

## File Structure

```
.
├── Dockerfile          # Docker configuration file
├── nginx.conf          # Custom Nginx configuration file
└── static/             # Directory containing static files
```

### `Dockerfile`
- Uses the lightweight `nginx:alpine` image.
- Copies a custom `nginx.conf` configuration file.
- Serves static files from the `static` directory.

### `nginx.conf`
- Configures Nginx to:
  - Serve static files from `/usr/share/nginx/html`.
  - Use secure HTTP headers.
  - Log access and error data.
- Default server listens on port `8080`.

## Usage

### Prerequisites
- [Docker](https://www.docker.com/) installed on your system.

### Steps

1. **Prepare Static Files**
   - Place all your static files (HTML, CSS, JS, images, etc.) in the `static/` directory.

2. **Build the Docker Image**
   ```bash
   docker build -t nginx-static-site .
   ```

3. **Run the Container**
   ```bash
   docker run -p 8080:8080 nginx-static-site
   ```

4. **Access Your Site**
   - Open your browser and navigate to `http://localhost:8080`.

## Configuration Details

### Security Headers
The following HTTP headers are configured for enhanced security:

- `X-Frame-Options: DENY`: Prevents the site from being embedded in an iframe.
- `Strict-Transport-Security`: Enforces HTTPS connections.
- `X-XSS-Protection: 0`: Disables deprecated XSS protection.
- `Referrer-Policy: strict-origin-when-cross-origin`: Controls how much referrer information is shared.

### Customizing Configuration
To modify the Nginx configuration, edit the `nginx.conf` file and rebuild the Docker image.

## Deployment

For production environments, ensure that:
- Your static files are optimized (e.g., minified).

