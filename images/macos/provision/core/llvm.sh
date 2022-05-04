#!/bin/bash -e -o pipefail
source ~/utils/utils.sh

llvmVersion=$(get_toolset_value '.llvm.version')

brew_smart_install "llvm@${llvmVersion}"

#invoke_testsinvoke_tests "LLVM"$