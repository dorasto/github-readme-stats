# Use the Bun image as the base image
FROM oven/bun:latest

# Set the working directory in the container
WORKDIR /app

# Copy package.json and bun.lockb first (for caching)
COPY package.json ./

# Install dependencies
RUN bun install

# Now copy the rest of your source code (including express.js)
COPY . .

# Set the production environment
ENV NODE_ENV=production

# Expose the application port
EXPOSE 9000

# Run your app
CMD ["bun", "express.js"]