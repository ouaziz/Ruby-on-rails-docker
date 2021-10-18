FROM ruby:3.0
WORKDIR /app

COPY app/Gemfile ./
COPY app/Gemfile.lock ./
RUN bundle install
RUN rails db:drop 
RUN rails db:create 
RUN rails db:migrate 
RUN rails db:seed
