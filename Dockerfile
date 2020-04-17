FROM ruby:2.7

RUN apt-get update -y

RUN apt-get install -y nodejs --no-install-recommends

RUN apt-get install -y default-mysql-client postgresql-client sqlite3 --no-install-recommends

RUN curl -L https://npmjs.org/install.sh | sh

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -y
RUN apt-get install yarn

RUN rm -rf /var/lib/apt/lists/*

ENV RAILS_VERSION 6.0

RUN gem install rails --version "$RAILS_VERSION"

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN sh start.sh

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
