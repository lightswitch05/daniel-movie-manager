FROM ruby:2.4-alpine

RUN apk --no-cache add --upgrade \
  build-base \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  && rm -rf /var/cache/apk/*

ADD ./ ./

RUN bundle install --without development test

CMD rails server -e production
