FROM rethinkdb:2.3

RUN echo 'deb http://httpredir.debian.org/debian jessie main' > /etc/apt/sources.list
RUN echo 'deb-src http://httpredir.debian.org/debian jessie main' >> /etc/apt/sources.list
RUN echo 'deb http://httpredir.debian.org/debian jessie-updates main' >> /etc/apt/sources.list
RUN echo 'deb-src http://httpredir.debian.org/debian jessie-updates main' >> /etc/apt/sources.list
RUN echo 'deb http://security.debian.org/ jessie/updates  main' >> /etc/apt/sources.list
RUN echo 'deb-src http://security.debian.org/ jessie/updates  main' >> /etc/apt/sources.list

RUN mv /etc/apt/sources.list.d/rethinkdb.list /etc/apt/sources.list.d/rethinkdb.list.bak

RUN apt-get update
RUN apt-get install -y apt-transport-https gnupg-curl

RUN echo 'deb https://download.rethinkdb.com/apt jessie main' > /etc/apt/sources.list.d/rethinkdb.list
RUN echo ''

RUN apt-key adv --fetch-keys https://download.rethinkdb.com/apt/keyring.gpg

RUN apt-get update