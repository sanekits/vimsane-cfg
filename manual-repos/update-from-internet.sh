#!/bin/bash
# Install or update manual-repos from the Internet.  We
# scan the contents of ./plugin-list.vim and parse the source
# locations from that.

function errExit {
    echo "ERROR: $*" >&2
    exit 1
}

function parseReposFromPluginList {
    # Find rows that start with Plugin, print the 4th field, verify that it
    # starts with '@', and then strip the '@' to get the raw github-relative
    # path
    grep -e '^Plugin' ./plugin-list.vim | awk '{print $4}' | grep -e '@' | tr -d '@'
}

function makeSourceUrl {
    echo "https://github.com/${1}"
}

function installOrUpdate {
    local repo=$1
    local base=$(basename $1)
    url="$(makeSourceUrl $repo)" 
    mkdir -p ../bundle
    if [[ ! -d $repo ]]; then
       ( 
         git clone "$(makeSourceUrl $repo)" ./${repo} || errExit "Can't clone $url"
         # Vundle doesn't like repos that are more than one level deep:
         ln -sf ${repo} ${base}
       ) 
    else
       (
        cd $repo  && git pull  || errExit "Can't pull $url"
       )
    fi
    (
        cd ../bundle && ln -sf ../manual-repos/${base}
    )
    echo "${repo} updated successfully."
}

if [[ -z $sourceMe ]]; then
    repoList=$(parseReposFromPluginList)
    for repo in $repoList; do
        echo "${repo}:"
        installOrUpdate ${repo}
    done
fi

