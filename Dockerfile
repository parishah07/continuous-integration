# Use an official Node.js runtime as a parent image
FROM node:18-alpine
# Set the working directory in the container
WORKDIR /usr/src/app
# Copy package.json and package-lock.json
COPY package*.json ./
# Install app dependencies
RUN npm ci --only=production
# Bundle app source
COPY . .
# Your app binds to port 3000 so you'll use this port
EXPOSE 3000
# Define the command to run your app
CMD [ "node", "index.js" ]