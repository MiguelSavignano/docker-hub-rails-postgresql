FROM ruby:2.5.0
LABEL mainteiner=migue.masx@gmail.com
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  git-all \
  postgresql-client \
  apt-transport-https

# install node 8.9.1 LTS
RUN curl -sL https://deb.nodesource.com/setup_8.x | bin/bash -
RUN apt-get update && apt-get install -y \
  nodejs

RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp

RUN gem install bundler
