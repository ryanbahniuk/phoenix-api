FROM elixir:1.10.3
MAINTAINER ryan.bahniuk@gmail.com

ENV HOME=/Users/ryanbahniuk/Code/phoenix_api
WORKDIR $HOME

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y inotify-tools build-essential postgresql-client && \
    mix local.rebar --force && \
    mix local.hex --force

EXPOSE 4000

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

ADD . $HOME
