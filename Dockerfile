FROM ianks/docker-jruby
MAINTAINER tuxedo

# Environment variables
ENV RAILS_ENV production
ENV JRUBY_OPTS --2.0
ENV DEBIAN_FRONTEND noninteractive

# Dependencies
RUN apt-get update && apt-get install -y curl lsb-release git-core --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://deb.nodesource.com/setup | sh -
RUN apt-get install -y nodejs

# Configure Rails
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ADD Gemfile /usr/src/app/
ADD Gemfile.lock /usr/src/app/
RUN bundle install --without development test
ADD . /usr/src/app
RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "torqbox"]
