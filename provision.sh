#!/bin/bash

# vagrant destroy -f && vagrant box update && vagrant up

echo "This is provision.sh for the website box."

echo "Updating.."
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -f -y install

# tools for ruby and what not.
sudo apt-get -y install git-core nodejs curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
