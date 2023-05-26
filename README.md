# Use custom NGINX config files for Synology Web Station
I wrote a blog post about creating a [custom NGINX config for Synology Web Station on DSM 7.2](https://manthings.net/custom-nginx-config-for-synology-web-station-on-dsm-7-2/) and thought I'd post the script here too. I hope you find it useful!

[This bash script](https://github.com/marknokes/synology-nginx-config/blob/main/add-nginx-include.sh) iterates over Synology Web Station NGINX config directory (DSM 7.2) and adds an include statement for your custom nginx.conf. You shouldn't need to modify anything more than the first two variables, if any at all.

#### # Edit this variable if necessary. Path to web directory
web_dir=/volume1/web

#### # Edit this variable if necessary. The name of your desired config file
conf_file=nginx.conf
