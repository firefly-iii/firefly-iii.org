#!/bin/bash
rm -rf _site
rm _config.yml
cp _config-live.yml _config.yml
bundle exec jekyll build

rsync -rv _site/ sander@firefly-iii.org:/var/www/firefly-iii.org

rm _config.yml