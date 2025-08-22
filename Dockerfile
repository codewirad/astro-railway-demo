# Use official Node.js image
FROM caddy:alpine 

RUN apk update & apk add --no-cache nodejs npm
# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy all source code
COPY . .

# Build Astro project (outputs to /app/dist)
RUN npm run build


# Stage 2: Serve with Caddy
FROM caddy:alpine AS runner

# Copy built static site into Caddy's html dir
COPY --from=builder /app/dist /usr/share/caddy

# Expose port 80 (Caddy default)
EXPOSE 80

# Use Caddy’s built-in CMD