<p align="center">
  <img src="http://leitnercalendar.anwilc.com/logo.svg?97e5e7a3a52d4750397345d8775008d1" alt="Logo" width="600" />
</p>
<br>

# Leitner Calendar

A simple website for you to help keep track of which group of Leitner flash cards to review today. Check it out at [leitnercalendar.anwilc.com](http://leitnercalendar.anwilc.com)

I created this because I like using physical flashcards but I don't want a [physical calendar you have to keep up to date](https://youtu.be/uvF1XuseZFE?t=23). So this page does it for you! 

Just put in the day you started and it'll tell you what group you need to review. If you have cookies allowed it will remember what start date you put in previously.

## Implementation

It's a simple static webpage built upon Vue.js combined with Typescript, packed using webpack and then hosted within a Docker container running Nginx.

## Steps to host locally

1) Install Docker if you don't already have it
2) Run `docker-compose up`. This will require usage of port 80 but you can change that in the docker-compose.yml configuration.
3) Go to localhost

Note that there is a docker-compose.prod.yml, it assumes there is a network called production that has a reverse proxy container that will forward requests. That's why port 80 isn't exposed outside the docker swarm in production.
