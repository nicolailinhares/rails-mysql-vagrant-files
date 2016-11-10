#!/bin/sh -e

export DEBIAN_FRONTEND=noninteractive

DEPS_INSTALLED_ON=/etc/vm_deps_installed
if [ -f "$DEPS_INSTALLED_ON" ]
then
  echo "Dependencies were already installed at: $(cat $DEPS_INSTALLED_ON)"
  exit
fi

apt-get update

apt-get -y install mysql-server

service mysql restart

apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev libpq-dev npm libsqlite3-dev imagemagick libmysqlclient-dev

apt-get -y remove ruby

# Tag the provision time:
date > "$DEPS_INSTALLED_ON"
