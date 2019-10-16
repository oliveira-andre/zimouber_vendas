# setting up the project

building docker image container
```
docker-compose build
```

to install gems
```
docker-compose run --rm website bundle install
```

create and migrate database
```
docker-compose run --rm website bundle exec rake db:create
docker-compose run --rm website bundle exec rake db:migrate
```

starting application
```
docker-compose up
```

running tests

rspec
```
docker-compose run --rm website bundle exec rspec
```

rubycritic
```
docker-compose run --rm website bundle exec rubycritic
```