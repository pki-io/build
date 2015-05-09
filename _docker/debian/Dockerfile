FROM debian:jessie
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y ruby && apt-get install -y build-essential ruby-dev git curl
RUN gem install fpm --no-ri --no-rdoc
COPY go1.4.1.linux-amd64.tar.gz /go1.4.1.linux-amd64.tar.gz 
