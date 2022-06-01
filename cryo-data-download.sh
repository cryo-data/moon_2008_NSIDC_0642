#!/usr/bin/env bash

wget --load-cookies ~/.urs_cookies --save-cookies ~/.urs_cookies --keep-session-cookies --no-check-certificate --auth-no-challenge=on -r -np -e robots=off --spider --force-html -nH --cut-dirs=2 https://n5eil01u.ecs.nsidc.org/MEASURES/NSIDC-0642.001/ > stdout.txt 2> stderr.txt

echo "url,file" > urls.txt
for url in $(grep '^--' stderr.txt | awk '{ print $3 }' | grep -v '\(\/?\|\/$\)' | sort | uniq); do
  echo $url,$(echo $url| cut -d"/" -f6-) >> urls.txt
done

# --dry-run
datalad addurls --nosave --fast urls.txt '{url}' '{file}'

rm stderr.txt stdout.txt urls.txt
