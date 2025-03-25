# Use specific Node.js version
FROM node:latest 


# Set the working directory
WORKDIR /app

# Copy only package files first to optimize Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Expose port 8000
EXPOSE 8000

# Start the application
CMD ["npm", "start"]

