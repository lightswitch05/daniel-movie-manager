#!/usr/bin/env bash

NGINX_UPSTREAM_FILE="/etc/nginx/conf.d/upstream.conf"
MOVIE_API_HOST=${MOVIE_API_HOST:='localhost'}

mv /etc/nginx/conf.d/nginx.conf /etc/nginx

cat <<EOF > $NGINX_UPSTREAM_FILE
upstream movie-api {
    server ${MOVIE_API_HOST}:3000;
}

EOF
