#!/bin/bash
set -e

function create_user_with_db() {
  NEW_USER=$1
  NEW_PASSWORD=$2
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER ${NEW_USER} with ENCRYPTED PASSWORD '${NEW_PASSWORD}';
    CREATE DATABASE ${NEW_USER};
    GRANT ALL PRIVILEGES ON DATABASE ${NEW_USER} TO ${NEW_USER};
    ALTER DATABASE ${NEW_USER} OWNER TO ${NEW_USER};
    GRANT USAGE ON SCHEMA public to ${NEW_USER};
    ALTER ROLE $NEW_USER IN DATABASE $NEW_USER SET search_path = public;
EOSQL

#  psql -v ON_ERROR_STOP=1 --username "$NEW_USER" --dbname "$NEW_USER" <<-EOSQL
#    CREATE SCHEMA movie_api;
#    ALTER ROLE $NEW_USER IN DATABASE $NEW_USER SET search_path = movie_api, public;
#EOSQL
}

#create_user_with_db "movie_api_development" "${DEV_DB_PASSWORD}"
#create_user_with_db "movie_api_test" "${TEST_DB_PASSWORD}"
