#!/bin/sh -e

MAILCATCHER_INSTALLED_ON=/etc/vm_mailcatcher_installed
if [ -f "$MAILCATCHER_INSTALLED_ON" ]
then
  echo "mailcatcher was already installed at: $(sudo cat $GEMS_INSTALLED_ON)"
  echo ""
  exit
fi

cd /vagrant

~/.rbenv/shims/gem install mailcatcher

echo 'mailcatcher --http-ip=0.0.0.0' >> ~/.bashrc

sudo touch "$MAILCATCHER_INSTALLED_ON"

