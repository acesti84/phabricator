FROM lunalabs/ubuntu18

USER root
RUN apt-get update
RUN apt-get -y upgrade

RUN add-apt-repository -y ppa:ondrej/php

RUN apt-get -y install git
RUN apt-get -y install apache2 
RUN apt-get -y install libapache2-mod-php
RUN apt-get -y install php 
RUN apt-get -y install php-dev
RUN apt-get -y install php-mysql      
RUN apt-get -y install php-gd
RUN apt-get -y install php-curl
RUN apt-get -y install php-apcu
RUN apt-get -y install php-cli
RUN apt-get -y install php-json
RUN apt-get -y install php-mbstring
RUN apt-get -y install libpcre3-dev
RUN apt-get -y install php-pear
RUN apt-get -y install python-pygments
RUN apt-get -y install subversion
RUN apt-get -y install mercurial

#install imagemagic
WORKDIR /installazione
RUN wget https://www.imagemagick.org/download/ImageMagick-7.0.8-14.tar.gz 
RUN tar xf ImageMagick-7.0.8-14.tar.gz
WORKDIR /installazione/ImageMagick-7.0.8-14
RUN ./configure
RUN make
RUN make install
RUN ldconfig /usr/local/lib

RUN a2enmod rewrite

RUN mkdir -m777 -p /installazione

WORKDIR /installazione
RUN git clone https://github.com/phacility/libphutil.git
RUN git clone https://github.com/phacility/arcanist.git
RUN git clone https://github.com/phacility/phabricator.git
RUN chown -R www-data:www-data /installazione
