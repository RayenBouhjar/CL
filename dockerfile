# stage 1
FROM node:latest
WORKDIR /app
COPY . .
RUN npm install -f --legacy-peer-deps
# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/crudtuto-Front /usr/share/nginx/html