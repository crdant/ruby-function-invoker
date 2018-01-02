FROM ruby:2.4.3-slim

RUN apt-get update -qq && apt-get install -y build-essential

COPY src/main/ruby/* /
RUN bundle install

RUN apt-get remove -y --purge build-essential

EXPOSE 8080

ENTRYPOINT ["/usr/bin/env", "ruby", "./server.rb", "-o", "0.0.0.0"]
