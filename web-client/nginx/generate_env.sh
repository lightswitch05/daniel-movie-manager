#!/usr/bin/env bash

NGINX_UPSTREAM_FILE="/etc/nginx/conf.d/upstream.conf"

mv /etc/nginx/conf.d/nginx.conf /etc/nginx

cat <<EOF > $NGINX_UPSTREAM_FILE
upstream movie-api {
    server localhost:3000;
}

EOF
