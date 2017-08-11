FROM debian:stretch-slim
MAINTAINER KALRONG <kalrong@kalrong.net>

WORKDIR /root
COPY database.yml /root/database.yml
RUN apt-get update; apt-get -y upgrade; apt-get -y install wget
RUN echo 'deb http://apt.metasploit.com/ jessie main' > /etc/apt/sources.list.d/metasploit-framework.list
RUN wget -O - http://apt.metasploit.com/metasploit-framework.gpg.key | apt-key add -
RUN apt-get update; apt-get -y install metasploit-framework
#Cleaning the image of unnecessary files
RUN apt autoremove; apt-get autoclean

CMD [ "/usr/bin/msfconsole", "-y", "/root/database.yml" ]
