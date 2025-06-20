#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install --deployment

if [ "$RENDER_GIT_BRANCH" = "main" ]; then
  echo "Restoring latest database backup..."
  bundle exec rake db:restore_latest
fi

bundle exec rails assets:precompile
bundle exec rails assets:clean
