FROM ruby:2.3

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Set timezone
RUN echo "America/Sao_Paulo" > /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get update -y && \
 apt-get install -y unzip xvfb \
 qt5-default libqt5webkit5-dev \
 gstreamer1.0-plugins-base \
 gstreamer1.0-tools gstreamer1.0-x \
 freetds-dev \
 libnss3 libxi6 libgconf-2-4

# install chrome
RUN apt-get update -y && \
       wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
       dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

# install chromedriver and place it ib path
RUN wget https://chromedriver.storage.googleapis.com/2.36/chromedriver_linux64.zip && \
       unzip chromedriver_linux64.zip && \
       mv chromedriver /usr/local/bundle/bin/


RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.20.0/geckodriver-v0.20.0-linux64.tar.gz && \
    tar xzf geckodriver-v0.20.0-linux64.tar.gz && \
    mv geckodriver /usr/local/bundle/bin/

WORKDIR /usr/src/app/

# install required gem files for Capybara
COPY ./Gemfile /usr/src/app/
RUN gem install bundler
RUN bundle install
