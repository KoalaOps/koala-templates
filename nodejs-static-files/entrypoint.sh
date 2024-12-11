#!/bin/sh

# Default values
FOLDER=${FOLDER:-"."}
DEFAULT_EXT=${DEFAULT_EXT:-"html"}
PORT=${PORT:-8080}

# Build the command dynamically based on environment variables
CMD="http-server \"$FOLDER\""

# Optional flags
[ "$SHOW_DIRECTORY_LISTINGS" = "true" ] && CMD="$CMD -d"
[ "$NO_DOTFILES" != "true" ] && CMD="$CMD --dotfiles"
[ "$GZIP" = "true" ] && CMD="$CMD -g"
[ "$BROTLI" = "true" ] && CMD="$CMD -b"
[ -n "$MIMETYPES" ] && CMD="$CMD --mimetypes \"$MIMETYPES\""
[ -n "$CACHE_TIME" ] && CMD="$CMD -c$CACHE_TIME"
[ -n "$PROXY" ] && CMD="$CMD --proxy \"$PROXY\""
[ -n "$PROXY_OPTIONS" ] && CMD="$CMD --proxy-options \"$PROXY_OPTIONS\""
[ "$CORS" = "true" ] && CMD="$CMD --cors"
[ "$SILENT" = "true" ] && CMD="$CMD -s"

# Append the port
CMD="$CMD -p $PORT --ext \"$DEFAULT_EXT\""

# Output the command for debugging
echo "Running command: $CMD"

# Execute the command
exec sh -c "$CMD"

# Delete the entry point script
rm -- "$0"