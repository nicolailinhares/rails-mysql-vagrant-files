#!/bin/sh -e

GEMS_INSTALLED_ON=/etc/vm_gem_installed
if [ -f "$GEMS_INSTALLED_ON" ]
then
  echo "gems were already installed at: $(sudo cat $GEMS_INSTALLED_ON)"
  echo ""
  exit
fi
~/.rbenv/shims/ruby -v
cd /vagrant
~/.rbenv/shims/gem install bundler
~/.rbenv/bin/rbenv rehash
~/.rbenv/shims/gem install nokogiri -- --use-system-libraries

~/.rbenv/shims/bundle config path ~/.vendor/bundle
~/.rbenv/shims/bundle install --path ~/.vendor/bundle

sudo touch "$GEMS_INSTALLED_ON"

