# Base image
FROM    ruby:latest

#machine config
RUN     apt-get update -qq && apt-get install -y apt-utils locales
RUN     sed -i -e 's/# us_US.UTF-8 UTF-8/us_US.UTF-8 UTF-8/' /etc/locale.gen && \
        locale-gen
ENV     LANGUAGE us_US.UTF-8
ENV     LANG us_US.UTF-8
ENV     LC_ALL us_US.UTF-8
RUN     apt-get install -y build-essential libpq-dev nodejs libjpeg-dev libpng-dev
RUN     mkdir -p /app

# Install gems
COPY    ./Gemfile /app/Gemfile
COPY    ./Gemfile.lock /app/Gemfile.lock
WORKDIR /app
RUN     bundle install
