FROM node:16 as node
WORKDIR /opt/app
COPY ./*.json ./
RUN npm install
ADD . .
RUN npm run build

FROM nginx:1.21.6
COPY --from=node /opt/app/build /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80