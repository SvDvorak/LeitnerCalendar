FROM node:12.19.0 as builder

WORKDIR /home/build/

ARG NODE_ENV=development
COPY package.json package-lock.json /home/build/
RUN npm install

COPY . /home/build
RUN npm run build


FROM nginx as hoster

COPY --from=builder /home/build/dist /var/www/leitnercalendar
COPY nginx.conf /etc/nginx/conf.d/default.conf
