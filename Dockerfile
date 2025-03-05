FROM node:18-alpine

WORKDIR /app

# Install the BrowserTools MCP package
RUN npm install -g @agentdeskai/browser-tools-mcp@1.1.0

# Create a non-root user to run the application
RUN addgroup -S mcp && adduser -S mcp -G mcp
USER mcp

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy application code
COPY . .

# Build the application
RUN npm run build

# Command will be provided by smithery.yaml
# Default command as fallback
CMD ["npx", "@agentdeskai/browser-tools-mcp@1.1.0"]
