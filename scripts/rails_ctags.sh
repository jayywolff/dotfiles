#! /bin/bash

# generate custom ctags for rails projects
cd $1
if [ -f 'tags' ]; then rm tags ; fi
echo "Generating ruby ctags for $(pwd)"
ctags --languages=ruby --recurse=yes \
--regex-ruby="/(^|[:;])[ \t]*([A-Z][[:alnum:]_]+) *=/\2/c,class,constant/" \
--regex-ruby="/^[ \t]*attr_(reader|writer|accessor) (:[a-z0-9_]+, )*:([a-z0-9_]+)/\3/A,attr/" \
--regex-ruby="/^[ \t]*describe ['\"](.*)['\"].* do/\1/" \
--regex-ruby="/^[ \t]*scope[ \t]*:([a-zA-Z0-9_]+)/\1/" \
--exclude="node_modules" \
--exclude="log" \
--exclude=".git" \
--exclude="*.min.js" . $(bundle list --paths)
tac tags > tags_
rm tags
mv tags_ tags

echo "Fresh ctags generated @$(pwd) on $(date)"
