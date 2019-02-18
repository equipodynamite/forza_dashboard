FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs mariadb-server vim
RUN mkdir /app
WORKDIR /app

ENV HOME=/app PATH=/app/bin:$PATH


ADD Gemfile* /app/

RUN set -ex \
  && mkdir -p /app/tmp/cache \
  && mkdir -p /app/tmp/pids \
  && mkdir -p /app/tmp/sockets

RUN set -ex && bundle install --jobs=4 --retry=3
COPY . /app

# Add a script to be executed every time the container starts.
COPY /bin/dev-entrypoint /usr/bin/
RUN chmod +x /usr/bin/dev-entrypoint
ENTRYPOINT ["dev-entrypoint"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]