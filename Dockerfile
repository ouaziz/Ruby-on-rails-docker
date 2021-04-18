FROM ruby:3.0.1-alpine

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python3 \
      tzdata \
      yarn

RUN gem update --system
RUN echo "gem: --no-document" >> ~/.gemrc
# RUN gem install bundler
RUN gem install rails
WORKDIR /app
# COPY ./script_api/Gemfile /app/Gemfile
# COPY ./script_api/Gemfile.lock /app/Gemfile.lock
COPY ./script_api/* /app
RUN bundle install
# RUN bundle config build.nokogiri --use-system-libraries
# RUN bundle update
# COPY ./script_api/package.json ./
# RUN yarn install --check-files
# COPY ./entrypoints /entrypoints
# ENTRYPOINT ["/entrypoints/docker-entrypoint.sh"]
COPY ./entrypoints/*  /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/sidekiq-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]