#!/bin/bash

export PATH=$PATHADD:$PATH

check() {
    hugo check
}

dev() {
    hugo server -wDs . -d dev
}

publish:() {
    hugo -s .
}

version() {
    hugo version
}

if [[ "$1" = 'dev' ]]; then
    dev
elif [[ "$1" = 'check' ]]; then
    check
elif [[ "$1" = 'publish' ]]; then
    publish
elif [[ "$1" = 'version' ]]; then
    version
elif [[ -z "$1" ]]; then
    exec "/bin/bash"
else
    echo "Usage: docker-compose run --rm blog <command> - run|test (empty command drops into interactive bash shell)"
fi