#!/bin/bash
rm _config.yml
cp _config-local.yml _config.yml
rm -rf _site
bundle exec jekyll build

