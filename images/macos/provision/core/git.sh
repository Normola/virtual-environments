#!/bin/bash -e -o pipefail
source ~/utils/utils.sh

echo Installing Git...
# Temporary hardcode version 2.35.1 due to the issue with the actions\checkout https://github.com/actions/checkout/issues/76
brew tap-new local/git
brew extract --version=2.35.1 git local/git
brew install git@2.35.1
brew untap -f local/homebrew-git

echo Installing Git LFS
brew_smart_install "git-lfs"

# Update global git config
git lfs install
# Update system git config
sudo git lfs install --system

echo Installing Hub
brew_smart_install "hub"

echo Disable all the Git help messages...
git config --global advice.pushUpdateRejected false
git config --global advice.pushNonFFCurrent false
git config --global advice.pushNonFFMatching false
git config --global advice.pushAlreadyExists false
git config --global advice.pushFetchFirst false
git config --global advice.pushNeedsForce false
git config --global advice.statusHints false
git config --global advice.statusUoption false
git config --global advice.commitBeforeMerge false
git config --global advice.resolveConflict false
git config --global advice.implicitIdentity false
git config --global advice.detachedHead false
git config --global advice.amWorkDir false
git config --global advice.rmHints false

#invoke_testsinvoke_tests "Git"$
