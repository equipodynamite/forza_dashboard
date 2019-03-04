FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs mariadb-server vim graphviz
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

# Add a script to be executed every time the container starts.
COPY bin/dev-entrypoint /usr/bin/
RUN chmod +x /usr/bin/dev-entrypoint
ENTRYPOINT ["dev-entrypoint"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
