# 1. Build Process
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# 2. Run Process
FROM nginx
COPY --from=builder /app/build/ /usr/share/nginx/html/