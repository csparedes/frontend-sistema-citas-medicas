FROM node:20-alpine3.17 as dependencies
WORKDIR /app
COPY package.json package.json
RUN yarn install
COPY . .
RUN yarn build

FROM nginx:stable-alpine3.17 as runner
EXPOSE 80
COPY --from=dependencies /app/dist /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
RUN rm /etc/nginx/conf.d/default.conf
ENTRYPOINT [ "nginx", "-g", "daemon off;"]