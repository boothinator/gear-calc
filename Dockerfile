# Use node image to build
FROM node:20 as build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install
RUN npm install

# Copy everything from source context to working directory
COPY . .

# Build
RUN npm run build

# Start new context
FROM nginx:alpine

WORKDIR /app

# Copy build output
COPY --from=build /app/dist .

# Copy NGINX config
COPY --from=build /app/nginx.conf /etc/nginx/nginx.conf