#!/usr/bin/env bash

set -e
mkdir -p moo-postgresql-layer/lib

# Copy lib files from postgres to lib directory
cp postgresql/tmp_install/usr/local/pgsql/lib/libpq.so* moo-postgresql-layer/lib
cp vendor/moo-postgresql moo-postgresql-layer

# Zip the layer
cd moo-postgresql-layer
zip -r aws-lambda-layer-moo-postgresql.zip *

# Move to project root
cd ..
mv moo-postgresql-layer/aws-lambda-layer-moo-postgresql.zip .
rm -r moo-postgresql-layer
