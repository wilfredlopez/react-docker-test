
# BUILD FACE
# Use an existing image as base
FROM node:alpine as builder

# speficy a working directory
WORKDIR /app

# Copy package.json
COPY package.json .
# Download and install a dependency
RUN npm install
# Copy all other directories
COPY . .
# Build project
RUN npm run build

# /app/build

FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html


# THE COMMAND WOULD BE THE DEFAULT FOR ngnx SO WE ARE NOT DEFINING IT