# Use Puppeteer prebuilt image
FROM ghcr.io/puppeteer/puppeteer:latest

# Set working directory
WORKDIR /app

# Copy package.json first
COPY package*.json ./

# Install dependencies as root (Render allows this during build)
RUN npm install

# Copy the rest of your app
COPY . .

# Expose the app port
EXPOSE 3000

# Run as the non-root Puppeteer user
USER pptruser

# Start your app
CMD ["node", "server.js"]
