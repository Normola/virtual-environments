#!/bin/bash -e -o pipefail
source ~/utils/utils.sh

# Set env variable for vcpkg
VCPKG_INSTALLATION_ROOT=/usr/local/share/vcpkg
echo "export VCPKG_INSTALLATION_ROOT=${VCPKG_INSTALLATION_ROOT}" | tee -a ~/.bashrc

# Install vcpkg
git clone https://github.com/Microsoft/vcpkg $VCPKG_INSTALLATION_ROOT
$VCPKG_INSTALLATION_ROOT/bootstrap-vcpkg.sh
$VCPKG_INSTALLATION_ROOT/vcpkg integrate install
chmod -R 0777 $VCPKG_INSTALLATION_ROOT
ln -sf $VCPKG_INSTALLATION_ROOT/vcpkg /usr/local/bin

#invoke_testsinvoke_tests "Common" "vcpkg"$
