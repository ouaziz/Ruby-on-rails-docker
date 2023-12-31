FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs npm

WORKDIR /app
RUN gem install bundler
RUN gem install rails

COPY assetsMgmt/Gemfile ./
# COPY assetsMgmt/Gemfile.lock ./
RUN bundle install
RUN rails importmap:install
# RUN assetsMgmt/bin/importmap pin tailwindcss
# RUN rails db:drop 
# RUN rails db:create 
# RUN rails db:migrate 
# RUN rails db:seed
