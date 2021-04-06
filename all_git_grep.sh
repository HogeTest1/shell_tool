#!/bin/bash -x

# https://stackoverflow.com/questions/11543593/grep-for-stuff-in-multiple-git-repositories
all_git_grep() {
  find . -type d -name .git | while read line; do
    # サブシェル
    (
      cd $line/..
      cwd=$(pwd)
      str=`basename $cwd`
      # 緑色:$(tput setaf 2) 色解除:$(tput sgr0)
      # https://qiita.com/onokatio/items/5d282b72ac5565ae4569
      echo "$(tput setaf 2)[${str}]$(tput sgr0)"
      git --no-pager grep -n "$@"
    )
  done
}
