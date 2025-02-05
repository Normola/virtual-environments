#!/bin/bash -e
################################################################################
##  File:  sqlpackage.sh
##  Desc:  Install SqlPackage CLI to DacFx (https://docs.microsoft.com/sql/tools/sqlpackage/sqlpackage-download#get-sqlpackage-net-core-for-linux)
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/install.sh

# Install SqlPackage
download_with_retries "https://aka.ms/sqlpackage-linux" "." "sqlpackage.zip"

unzip -qq sqlpackage.zip -d /usr/local/sqlpackage
rm -f sqlpackage.zip
chmod +x /usr/local/sqlpackage/sqlpackage
ln -sf /usr/local/sqlpackage/sqlpackage /usr/local/bin

#invoke_testsinvoke_tests "Tools" "SqlPackage"$
