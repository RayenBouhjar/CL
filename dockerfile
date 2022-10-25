FROM node as build-stage 
WORKDIR /app
COPY package*.json /app/
RUN npm install --legacy-pear-deps
COPY ./ /app/
ARG configuration=production
RUN npm run build -- --output-path=./dist/out --configuration $configuration
FROM nginxinc/nginx-unprivileged
COPY --from=build-stage /app/dist/out/ /ustshare/nginx/html

EXPOSE 3000
CMD ["nginx","-g", "daemon off;"]
