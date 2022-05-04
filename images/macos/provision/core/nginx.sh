#!/bin/bash -e -o pipefail

brew install nginx
sudo sed -Ei '' 's/listen.*/listen 80;/' $(brew --prefix)/etc/nginx/nginx.conf

#invoke_testsinvoke_tests "WebServers" "Nginx"$
