# stage 1
FROM node:latest as build-stage 
WORKDIR /app
COPY . .
RUN npm install -f --legacy-peer-deps
# stage 2
FROM nginx:alpine
COPY --from=build-stage  /app/dist/crudtuto-Front /usr/share/nginx/html