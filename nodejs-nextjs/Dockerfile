# Stage 1: Build the application
FROM node:22 AS builder

# Set working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js app
RUN npm run build

# Stage 2: Serve the application
FROM node:22-slim AS runner

# Set working directory
WORKDIR /app

# Install only production dependencies
COPY package*.json ./
RUN npm install --omit=dev

# Copy build artifacts from the builder stage
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
# In case you use a next.config you can uncomment to following line
# COPY --from=builder /app/next.config.js ./

# Expose port
EXPOSE 8080

# Start Next.js app
CMD ["npm", "run", "start"]