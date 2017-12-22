#!/bin/bash

# vagrant destroy -f && vagrant box update && vagrant up

echo "This is provision.sh for the website box."

echo "Updating.."
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -f -y install

# tools for ruby and what not.
sudo apt-get install -y libssl-dev zlib1g-dev libreadline-dev git

# clone stuff and put them in the right dir:
echo "Cloning git..."
git clone git://github.com/sstephenson/rbenv.git /home/vagrant/.rbenv
git clone git://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
echo "Expanding bash_profile..."
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/vagrant/.bash_profile
echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bash_profile
chown -R vagrant:vagrant /home/vagrant/.bash_profile
chown -R vagrant:vagrant /home/vagrant/.rbenv
echo "Done!"
