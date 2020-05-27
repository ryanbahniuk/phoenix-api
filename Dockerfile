FROM elixir:latest
MAINTAINER ryan.bahniuk@gmail.com

ENV HOME=/Users/ryanbahniuk/Code/phoenix_api
ADD . $HOME
WORKDIR $HOME

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y inotify-tools build-essential postgresql-client && \
    mix local.rebar --force && \
    mix local.hex --force

EXPOSE 4000
