
FROM ruby:latest
RUN apt-get update \
  && apt-get install libxi6 \
  libnss3 \
  libgconf-2-4 \
  fonts-liberation \
  libappindicator3-1 \
  libasound2 \
  libatk-bridge2.0-0 \
  libatk1.0-0 \
  libcups2 \
  libgtk-3-0 \
  libx11-xcb1 \
  libxss1 \
  lsb-release \
  xdg-utils \
  libxcomposite1 -y

#instalacion de node si se va a usar la api de ejecucion
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs 
RUN npm install --save express 
RUN npm install --save request 
RUN npm install --save async 
 
RUN mkdir /usr/src/app
RUN mkdir /usr/src/app/output
ADD . .

#creando un espacio de trabajo para los features
#COPY healtcheck.sh /usr/src/app/cucumber-rap
WORKDIR /usr/src/app/cucumber-rap

COPY ./ .

# install our gem dependencies
RUN gem install bundler --source http://rubygems.org &&\
    bundle install

#ENTRYPOINT sh healtcheck.sh

#ejecutar un perfil
# CMD ["cucumber", "-p", "wip_web_ch_remote"]












# gem install cucumber \
# gem install rspec \
# gem install ffi \
# gem install watir-webdriver \
# gem install watir \
# gem install selenium-webdriver \
# gem install headless \
# gem install titleize \
# gem install json \
# gem install gherkin \
# gem install syntax \
# gem install watir-scroll \
# gem install fileutils \
# gem install nokogiri \
# gem install webdrivers \
# gem install appium_lib \
# gem install chromedriver-helper \
# gem install webdriver-user-agent \
# gem install statsd-ruby \
# gem install cucumber_statistics \
# gem install cucumber_characteristics \
# gem install parallel_tests \
# gem install report_builder \
# gem install watir-extensions-element-screenshot \
# gem install rubocop \
# gem install execjs \
# gem install mail