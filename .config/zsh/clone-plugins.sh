#!/usr/bin/env bash

set -eu
cd $(dirname $0)

git clone git@github.com:romkatv/powerlevel10k.git
git clone git@github.com:zsh-users/zsh-history-substring-search.git
git clone git@github.com:zsh-users/zsh-syntax-highlighting.git
