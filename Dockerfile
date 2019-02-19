FROM node as builder

WORKDIR /home/build/
COPY package.json package-lock.json /home/build/
RUN npm install

COPY . /home/build
RUN npm run build


FROM nginx as hoster

COPY --from=builder /home/build/dist /usr/share/nginx/html