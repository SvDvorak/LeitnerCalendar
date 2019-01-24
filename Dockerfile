FROM node

RUN useradd --user-group --create-home --shell /bin/false app

ENV HOME=/home/app

COPY package.json package-lock.json $HOME/LeitnerWebSchedule/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/LeitnerWebSchedule
RUN npm install

USER root
COPY . $HOME/LeitnerWebSchedule
RUN chown -R app:app $HOME/*
USER app

RUN npm run build