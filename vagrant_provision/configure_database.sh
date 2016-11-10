#!/bin/sh -e

DATABASE_CREATED_ON=/etc/vm_database_created
if [ -f "$DATABASE_CREATED_ON" ]
then
  echo "Database was already created at: $(sudo cat $DATABASE_CREATED_ON)"
  echo ""
  exit
fi

cd /vagrant
~/.rbenv/shims/bundle exec rake db:create
~/.rbenv/shims/bundle exec rake db:migrate

sudo touch "$DATABASE_CREATED_ON"
