#!/usr/bin/env bash

set -e

# Pull PostgreSQL manually (Git submodules doesn’t work for some reason)
git clone git://git.postgresql.org/git/postgresql.git
cd postgresql
git checkout tags/REL_11_2

# PostgreSQL build prerequisites
sudo yum install -y bison-devel readline-devel zlib-devel openssl-devel wget
sudo yum groupinstall -y 'Development Tools'

# Build PostgreSQL
./configure
make
make check
