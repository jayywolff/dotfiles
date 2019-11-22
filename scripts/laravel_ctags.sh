#! /bin/bash

# generate custom ctags for laravel projects
cd $1

if [ -f 'tags' ]; then rm tags ; fi

ctags --recurse=yes --fields=+aimlS --languages=php \
    --exclude="node_modules" \
    --exclude="vendor" \
    --exclude=".git" \
    --exclude=".env" \
    --exclude="bootstrap/cache" \
    --exclude="storage" \
    --append "vendor/laravel" .

# rm junk (need to replace with sed commands)
grep -v "/\^use" tags > tags_temp; mv tags_temp tags
grep -v "/\^namespace" tags > tags_temp; mv tags_temp tags

echo "Fresh ctags generated @$(pwd) on $(date)"
