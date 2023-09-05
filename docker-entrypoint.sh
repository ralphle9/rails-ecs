#!/bin/sh

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed

bundle exec rails s -p 3000 -b 0.0.0.0
