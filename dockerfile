# Use a lightweight Node.js image
FROM node:22-bullseye-slim

# Set working directory
WORKDIR /

# Copy build script first
COPY render-build.sh .

# Make build script executable
RUN chmod +x render-build.sh

# Run the build script to install dependencies & Chromium
RUN ./render-build.sh

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of your code
COPY . .

# Expose the port your app uses
EXPOSE 3000

# Start the app
CMD ["node", "index.js"]
