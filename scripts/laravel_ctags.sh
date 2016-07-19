#! /bin/bash
#This script generates custom ctags for laravel projects (could be optimized a bit better)
cd $1
ctags -R --fields=+aimlS --languages=php --exclude="vendor" --exclude="node_modules" --exclude=".git*" --exclude=".env" .
ctags -R --fields=+aimlS --languages=php --append vendor/laravel 
grep -v "/\^use" tags > tags_temp; mv tags_temp tags
grep -v "/\^namespace" tags > tags_temp; mv tags_temp tags
