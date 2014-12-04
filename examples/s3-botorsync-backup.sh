#!/bin/bash
for dir in /var/www/vhosts/*/
do
  dir=${dir%*/}
  find -L /var/www/vhosts/${dir##*/} -type l -delete
  /bin/nice -n 19 boto-rsync -a XXXXXXXXXXXXXXXX -s YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY --reduced --delete --ignore-empty --exclude=logs --exclude=httpdocs/wp-content/cache /var/www/vhosts/${dir##*/} s3://yourbucketname/daily/var/www/vhosts/${dir##*/}
done