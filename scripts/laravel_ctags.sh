#! /bin/bash
#This script generates custom ctags for laravel projects (could be optimized a bit better)
cd $1
ctags --recurse=yes --fields=+aimlS --languages=php --exclude="vendor|node_modules|.git*|.env" --regex-php=/^[ \t]*trait[ \t]+([a-z0_9_]+)/\1/t,traits/i .
ctags --recurse=yes --fields=+aimlS --languages=php --append vendor/laravel 
grep -v "/\^use" tags > tags_temp; mv tags_temp tags
grep -v "/\^namespace" tags > tags_temp; mv tags_temp tags
