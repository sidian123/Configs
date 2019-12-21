#!/bin/bash
comment='add some'
if [[ -n $1 ]] ; then
        comment=$1
fi

git add . && git commit -m "$comment"
git push