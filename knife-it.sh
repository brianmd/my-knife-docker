#!/bin/sh
name=my-knife
# knife docker create -I my-knife
# knife docker create -I my-knife -N $name
# knife docker create -I my-knife -N $name -r 'recipe[base::mkfile]'
knife docker create -I my-knife -N $name -r 'recipe[phpapp::mkfile]'

echo "to delete:"
echo "knife docker delete 3ebc494961fa --purge"
echo "  (note: replace 3eb... with id from 'docker ps')"
