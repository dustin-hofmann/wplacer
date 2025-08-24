FROM node:22-alpine

# Install system dependencies for canvas
RUN apk add --no-cache \
    cairo-dev \
    jpeg-dev \
    pango-dev \
    musl-dev \
    gcc \
    g++ \
    make \
    python3

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy application code
COPY . .

# Create data directory
RUN mkdir -p ./data

# Expose port
EXPOSE 80

# Set default environment
ENV NODE_ENV=production
ENV PORT=80

# Create non-root user
RUN addgroup -g 1001 -S nodejs
RUN adduser -S wplacer -u 1001

# Change ownership of app directory
RUN chown -R wplacer:nodejs /app
USER wplacer

# Start the application
CMD ["npm", "start"]
