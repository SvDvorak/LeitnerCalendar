FROM nginx

RUN apt-get update -qq &&\
    apt-get install -y -qq curl gnupg &&\
    curl -sL https://deb.nodesource.com/setup_11.x | bash - &&\
    apt-get install -y nodejs

RUN useradd --user-group --create-home --shell /bin/false app;

ENV HOME=/home/app

COPY package.json package-lock.json $HOME/LeitnerWebSchedule/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/LeitnerWebSchedule
RUN npm install

USER root
COPY . $HOME/LeitnerWebSchedule
RUN find . \( -path ./node_modules \) -prune -o -user root -print0 | xargs -0 chown app:app

RUN npm run build

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY dist /var/www/leitnercalendar