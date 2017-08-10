#!/bin/bash
# Install or update manual-repos from the Internet.  We
# scan the contents of ./plugin-list.vim and parse the source
# locations from that.
#
# INSTRUCTIONS: read ./plugin-list.vim Operation Notes

function errExit {
    echo "ERROR: $*" >&2
    exit 1
}

function trace {
    echo "tr: $*" >&2
}

export xlocal=false

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
    echo -n "Installing ${repo} [url=${url}]:"
    if $local; then
        echo " in local mode."
    else
        echo " in internet-enabled mode."
    fi
    mkdir -p ../bundle
    if $local ; then
       if  [[ ! -d $repo ]]; then
           ( errExit "Can't find $PWD/$repo.  This must be manually copied from an existing source first in --local mode." ) || return

       fi
    else
       # clone or update from internet:
       if  [[ ! -d $repo ]]; then
          ( git clone "$(makeSourceUrl $repo)" ./${repo} || errExit "Can't clone $url" )
       else
          ( cd $repo  && git pull  || errExit "Can't pull $url")
       fi
    fi
    # Vundle doesn't like repos that are more than one level deep:
    trace "Making ${repo} symlink to ${base}..."
    ln -sf ${repo} ${base}
    ( # Make a symlink in ../bundle:
        cd ../bundle && ln -sf ../manual-repos/${base}
    )
    echo "${repo} updated successfully."
}

function parseArgs {
   while [[ ! -z $1 ]]; do
       case $1 in
           -l|--local)
               # Don't go out to any github server
               xlocal=true
               ;;
       esac
       shift
   done
}

if [[ -z $sourceMe ]]; then
    repoList=$(parseReposFromPluginList)
    parseArgs $*
    for repo in $repoList; do
        echo "${repo}:"
        installOrUpdate ${repo}
    done
fi

