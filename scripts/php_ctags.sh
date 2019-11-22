#! /bin/bash

# generate custom ctags for php projects
cd $1

if [ -f 'tags' ]; then rm tags ; fi

ctags --recurse=yes --fields=+aimlS --languages=php \
    --exclude="node_modules" \
    --exclude="vendor" \
    --exclude=".git" \

echo "Fresh ctags generated @$(pwd) on $(date)"
