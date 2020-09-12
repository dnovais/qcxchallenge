# Gem install
bundle check || bundle install

# Server
bundle exec puma -C config/puma.rb