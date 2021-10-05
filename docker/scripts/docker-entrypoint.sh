#!/usr/bin/env sh

set -e;
echo 'Running docker-entrypoint.sh';

SKIP_DB=false

# parse arguments
while :
do
  case "$1" in
    "--skip-db")
      SKIP_DB=true
      shift
      ;;
    *)
      break
      ;;
  esac
done

# rubygems
echo 'Running bundle update --jobs=4 --retry=2';
bundle update --jobs=4 --retry=2;

# Database
if ! ${SKIP_DB}; then
  echo 'Running bundle exec rake db:exists';
  if ! bundle exec rake db:exists; then
    echo 'Running bundle exec rake db:create';
    bundle exec rake db:create;
  fi
  echo 'Running bundle exec rake db:environment:set';
  bundle exec rake db:environment:set;
  echo 'Running bundle exec rake db:migrate:status';
  if bundle exec rake db:migrate:status 2>&1 | grep "Schema migrations table does not exist yet."; then
    echo 'Running bundle exec rake db:migrate:reset';
    bundle exec rake db:migrate:reset;
  fi
  echo 'Running bundle exec rake db:migrate';
  bundle exec rake db:migrate;
fi

# webpacker
echo 'Running bundle exec rails webpacker:install';
bundle exec rails webpacker:install;

# Assert
echo 'Running bundle exec rake assets:precompile';
bundle exec rake assets:precompile;

# nginx
echo 'Running nginx';
cp -r ./docker/nginx/* /etc/nginx/;
nginx;

rm -rf /var/log/docker.container.log;
mkfifo /var/log/docker.container.log;
(while cat /var/log/docker.container.log; do :; done &)

# rails
echo 'bundle exec rails s -b 0.0.0.0 --no-log-to-stdout';
bundle exec rails s -b 0.0.0.0 --no-log-to-stdout;
