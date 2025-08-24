FROM node:22-alpine

# Install system dependencies for canvas and healthchecks
RUN apk add --no-cache \
    cairo-dev \
    jpeg-dev \
    pango-dev \
    musl-dev \
    gcc \
    g++ \
    make \
    python3 \
    curl

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy application code
COPY . .

# Create data directory with proper permissions
RUN mkdir -p ./data

# Create non-root user first
RUN addgroup -g 1001 -S nodejs
RUN adduser -S wplacer -u 1001

# Change ownership of app directory
RUN chown -R wplacer:nodejs /app

# Switch to non-root user
USER wplacer

# Expose port
EXPOSE 80

# Set default environment
ENV NODE_ENV=production
ENV PORT=80

# Add healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD curl -f http://localhost:$PORT/ || exit 1

# Start the application
CMD ["node", "server.js"]
