#!/usr/bin/env bash

set -e

# Pull PostgreSQL manually (Git submodules doesn’t work for some reason)
if [[ ! -d postgresql ]]; then
    git clone git://git.postgresql.org/git/postgresql.git
fi

cd postgresql
git checkout tags/REL_11_2

# PostgreSQL build prerequisites
sudo yum install -y bison-devel readline-devel zlib-devel openssl-devel wget
sudo yum groupinstall -y 'Development Tools'

# Build PostgreSQL
./configure
make
make check

# Return to root directory
cd ..

# Build layer
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

echo 'Done.'
echo 'You may now download `aws-lambda-layer-moo-postgresql.zip`, e.g. using `scp`'
