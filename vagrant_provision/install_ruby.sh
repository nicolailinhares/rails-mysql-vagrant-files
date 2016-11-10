#!/bin/sh -e

RUBY_INSTALLED_ON=/etc/vm_ruby_installed
if [ -f "$RUBY_INSTALLED_ON" ]
then
  echo "Ruby was already installed at: $(sudo cat $RUBY_INSTALLED_ON)"
  echo ""
  exit
fi

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
echo 'Successfully cloned rbenv'
export PATH="$HOME/.rbenv/bin:$PATH"
rbenv init -
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
echo 'Initialized rbenv'

rbenv install 2.2.0
rbenv global 2.2.0

echo "Successfully installed ruby"
echo ""

sudo touch "$RUBY_INSTALLED_ON"

