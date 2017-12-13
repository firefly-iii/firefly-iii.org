#!/bin/bash

# vagrant destroy -f && vagrant box update && vagrant up

echo "This is provision.sh for the website box."

echo "Updating.."
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -f -y install

# tools for ruby and what not.
sudo apt-get -y install git-core nodejs curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

# clone stuff and put them in the right dir:
git clone git://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
git clone git://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.bash_profile
echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bash_profile

# dit zelf draaien:
#exec $SHELL -l