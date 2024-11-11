# Stage 1: Build the application
FROM node:22 AS builder

# Set working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Next.js app by using next-env-replace the build support runtime env vars which allows to build once to all environments.
RUN npx next-env-replace set-env-vars -- npm run build

# Stage 2: Serve the application
FROM node:22-slim AS runner

# Set working directory
WORKDIR /app
RUN npm install -g next-env-replace
# Install only production dependencies
COPY package*.json ./
RUN npm install --omit=dev

# Copy build artifacts from the builder stage
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
# COPY --from=builder /app/next.config.js ./

# Expose port
EXPOSE 8080
RUN next-env-replace replace-env-vars 
# next-env-replace takes the run time env vars and insert them to the build result && Start Next.js app
CMD ["sh", "-c", "next-env-replace replace-env-vars && npm run start"]