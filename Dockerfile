FROM ruby:2.7.1
 
# add nodejs and yarn dependencies for the frontend
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
 
# Install dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nodejs yarn build-essential libpq-dev imagemagick git-all nano

# Install bundler
RUN gem install bundler
 
# Setting path
ENV INSTALL_PATH /qcxchallenge
 
# Creating our directory
RUN mkdir -p $INSTALL_PATH
 
# Setting our path as main directory
WORKDIR $INSTALL_PATH
 
# Copy our Gemfile to container
COPY Gemfile Gemfile.lock ./
 
# Setting path to gems
ENV BUNDLE_PATH /gems

# Install gems
RUN bundle install
 
# Copy our code to container
COPY . .