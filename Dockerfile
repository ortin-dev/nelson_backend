FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client && apt-get install -y shared-mime-info
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle update marcel activestorage
RUN bundle install
COPY . /myapp


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]
