FROM node:20 as build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

#FROM nginx:alpine

#WORKDIR /app

#COPY --from=build ./dist .

#COPY --from=build ./nginx.conf /etc/nginx/nginx.conf