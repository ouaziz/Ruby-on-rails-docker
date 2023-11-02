FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs npm

WORKDIR /app
RUN gem install bundler
RUN gem install rails

COPY rails7_saas/Gemfile ./
COPY rails7_saas/Gemfile.lock ./
RUN bundle install
RUN rails importmap:install
# RUN rails7_saas/bin/importmap pin tailwindcss
# RUN rails db:drop 
# RUN rails db:create 
# RUN rails db:migrate 
# RUN rails db:seed
