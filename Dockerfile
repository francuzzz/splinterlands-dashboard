FROM node:16-alpine as build
WORKDIR /opt/app
COPY ./*.json ./
RUN npm install
ADD . .
RUN npm run build

FROM nginx:1.21.6
COPY --from=build /opt/app/build /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80