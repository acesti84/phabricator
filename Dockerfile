FROM lunalabs/ubuntu18

USER root
RUN apt-get update

RUN add-apt-repository -y ppa:ondrej/php


RUN echo "Phabricator will be installed to: ${ROOT}.";
RUN apt-get -y install git
RUN apt-get -y install apache2 
RUN apt-get -y install libapache2-mod-php
RUN apt-get -y install php 
RUN apt-get -y install php-mysql      
RUN apt-get -y install php-gd
RUN apt-get -y install php-curl
RUN apt-get -y install php-apcu
RUN apt-get -y install php-cli
RUN apt-get -y install php-json
RUN apt-get -y install php-mbstring

RUN a2enmod rewrite

RUN mkdir -p /installazione
WORKDIR /installazione
RUN git clone https://github.com/phacility/libphutil.git