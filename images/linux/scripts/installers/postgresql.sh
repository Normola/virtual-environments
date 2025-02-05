#!/bin/bash -e
################################################################################
##  File:  postgresql.sh
##  Desc:  Installs PostgreSQL
################################################################################

# Source the helpers
source $HELPER_SCRIPTS/os.sh
source $HELPER_SCRIPTS/install.sh

REPO_URL="https://apt.postgresql.org/pub/repos/apt/"

# Preparing repo for PostgreSQL
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
echo "deb $REPO_URL $(getOSVersionLabel)-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list

# Fetch PostgreSQL version to install from the toolset
toolsetVersion=$(get_toolset_value '.postgresql.version')

# Install PostgreSQL
echo "Install PostgreSQL"
apt update
apt install postgresql-$toolsetVersion

echo "Install libpq-dev"
apt-get install libpq-dev

# Disable postgresql.service
systemctl is-active --quiet postgresql.service && systemctl stop postgresql.service
systemctl disable postgresql.service

rm /etc/apt/sources.list.d/pgdg.list

echo "postgresql $REPO_URL" >> $HELPER_SCRIPTS/apt-sources.txt

#invoke_testsinvoke_tests "Databases" "PostgreSQL"$
