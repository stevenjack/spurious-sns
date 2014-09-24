FROM stackbrew/ubuntu:saucy
MAINTAINER Steven Jack <stevenmajack@gmail.com>

RUN apt-get -y update
RUN apt-get install ruby ruby-dev make gcc+ build-essential git -y
RUN mkdir -p /var/data/fake-sns

ADD fake_sns /fake_sns
WORKDIR /fake_sns
RUN gem install bundler
RUN bundle install

EXPOSE 4572

#ENTRYPOINT ["bin/fake_sns", "--port" ,"4571", "--bind", "0.0.0.0", "--database", "/var/data/fake-sns/database.yml"]
