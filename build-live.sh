#!/bin/bash
rsync -rv --exclude=.git --exclude=.vagrant  ./ sander@firefly-iii.org:/var/www/firefly-iii.org
