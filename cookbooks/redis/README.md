# redis

create Redis server

## testing

    > cd cookbooks/redis
    > gem install bundler 
    > bundle config set --local path 'vendor/bundle'
    > bundle install
    > bundle exec rspec spec/redis-install_spec.rb