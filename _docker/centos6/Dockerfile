FROM centos:6
RUN yum update -y && yum groupinstall -y 'Development Tools' && yum install -y git curl ruby ruby-devel rubygems
RUN gem install fpm --no-ri --no-rdoc
COPY go1.4.1.linux-amd64.tar.gz /go1.4.1.linux-amd64.tar.gz 
