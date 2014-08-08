# Select ubuntu as the base image
FROM ubuntu

# Install nginx, nodejs and curl
RUN apt-get update -q
RUN apt-get install -qy nginx curl nodejs git-core build-essential libpq-dev
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN apt-get update
RUN apt-get -y -q install python-software-properties software-properties-common
RUN apt-get -y -q install postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3
USER postgres
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf
EXPOSE 5432
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Install rvm, ruby, bundler
USER root
RUN /bin/bash -l -c "export RAILS_ENV=production"
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 2.0.0"
RUN /bin/bash -l -c "gem install bundler --no-ri --no-rdoc"

# Add configuration files in repository to filesystem
ADD config/container/nginx-sites.conf /etc/nginx/sites-enabled/default
ADD config/container/start-server.sh /usr/bin/start-server
RUN chmod +x /usr/bin/start-server

# Add rails project to project directory
ADD ./ /rails

# set WORKDIR
WORKDIR /rails

# bundle install
RUN /bin/bash -l -c "gem install pg -v '0.15.1'"
RUN /bin/bash -l -c "bundle install"
RUN /bin/bash -l -c "service postgresql start"
RUN /bin/bash -l -c "bundle exec rake db:create"

# Publish port 80
EXPOSE 80

# Startup commands
ENTRYPOINT /usr/bin/start-server
