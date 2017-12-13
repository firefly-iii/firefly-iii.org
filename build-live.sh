#!/bin/bash
rm -rf _site
bundle exec jekyll build

rsync -rv _site/ sander@firefly-iii.org:/var/www/firefly-iii.org

