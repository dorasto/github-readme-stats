# Use the Bun image as the base image
FROM oven/bun:latest

# Set the working directory in the container to the workspace root
WORKDIR /app

# Copy package.json, bun.lockb, and the packages directory
# This ensures the entire workspace structure is available
COPY package.json bun.lock ./

# Install dependencies for the entire workspace
# This will install dependencies for all packages within 'packages/*'
RUN bun install

# Set the production environment
ENV NODE_ENV=production

# Expose the application port (backend runs on 5468)
EXPOSE 9000

CMD ["bun", "express.js"]