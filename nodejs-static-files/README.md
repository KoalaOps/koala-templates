# HTTP Server Docker Container

This repository provides a lightweight and customizable Docker container for serving static files using [http-server](https://www.npmjs.com/package/http-server). The configuration is dynamically controlled via environment variables, allowing flexibility in container behavior without modifying the image.

---

## Features

- Simple setup for serving static files.
- Fully configurable through environment variables.
- Supports advanced options like gzip, Brotli, proxy, and caching.
- Built on top of the lightweight `node:22-alpine` image.

---

## Build the Image

To build the Docker image:

```bash
docker build -t my-http-server .
```

---

## Environment Variables

| Variable                | Default    | Description                                                                 |
|-------------------------|------------|-----------------------------------------------------------------------------|
| `FOLDER`               | `.`        | The folder to serve static files from.                                     |
| `DEFAULT_EXT`                  | `html`     | Default file extension to serve.                                           |
| `PORT`                 | `8080`     | The port the HTTP server will listen on.                                   |
| `SHOW_DIRECTORY_LISTINGS` | `false`    | Whether to show directory listings (`true` or `false`).                    |
| `NO_DOTFILES`          | `false`    | If set to `true`, prevents dotfiles from being served.                     |
| `GZIP`                 | `false`    | Enables gzip compression for served files.                                 |
| `BROTLI`               | `false`    | Enables Brotli compression for served files.                               |
| `MIMETYPES`            |            | Custom MIME types mapping (e.g., `application/json`).                      |
| `CACHE_TIME`           |            | Cache control max-age in seconds.                                          |
| `PROXY`                |            | Proxy all requests to a specified URL.                                     |
| `PROXY_OPTIONS`        |            | Additional options for the proxy.                                          |
| `CORS`                 | `false`    | Enables CORS for all responses.                                            |
| `SILENT`               | `false`    | Suppresses log output.                                                     |

---

## Run the Container

To run the container:

```bash
docker run -p 8080:8080 \
  -e FOLDER="/my-folder" \
  -e SHOW_DIRECTORY_LISTINGS=true \
  -e GZIP=true \
  my-http-server
```

This command serves the contents of `/my-folder` with gzip compression and directory listings enabled, mapping the container's port `8080` to the host's port `8080`.


